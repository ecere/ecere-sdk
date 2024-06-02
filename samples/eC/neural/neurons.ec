import "ecere"

private static inline double sigmoid(double x)
{
   return 1 / (1 + exp(-x));
}

private static inline double sigmoidDerivative(double x)
{
   return x * (1 - x);
}

double GetRandDouble(double lo, double hi)
{
   return GetRandom((int)(lo * 1000000000), (int)(hi * 1000000000)) / 1000000000.0;
}

struct Neuron
{
   int dummy;

   double ::activate(double bias, const double * prevLayerSynapses, const double * prevLayerActivations, int dendronsCount, int nCount) // Feed-forward algorithm
   {
      double sum = bias;
      const double * synapse = prevLayerSynapses;
      int i;
      for(i = 0; i < dendronsCount; i++, synapse += nCount)
         sum += prevLayerActivations[i] * *synapse;
      return sigmoid(sum);
   }

   // NOTE: this is not called on the final output layer
   double ::backPropagate(const double * synapticWeights, const double * nextLayerErrors, int axonsCount)
   {
      double error = 0;
      int i;

      for(i = 0; i < axonsCount; i++)
         error += nextLayerErrors[i] * synapticWeights[i];
      return error;
   }
                                                                                                  // number of neurons in previous layer
   void ::teach(double errorLearnRate, const double * prevLayerActivations, double * prevLayerSynapses, int dendronsCount, int nCount)
   {
      if(errorLearnRate)
      {
         double * synapse = prevLayerSynapses;
         int i;

         for(i = 0; i < dendronsCount; i++, synapse += nCount)
            *synapse += errorLearnRate * prevLayerActivations[i];
      }
   }

   void ::Render(Surface surface, Size size, int ny, int height, int nx, int width,
      double biasRange, double weightRange, int axonsCount, double bias, const double * axonicSynapses)
   {
      double nw = Max(1, size.w / (2*width+1));     // Width of one neuron
      double nh = Max(1, size.h / (height+1));        // Height of one neuron
      double snw = Max(1, size.w / (2*axonsCount+1));   // Synapse width
      double spx = snw / 2;
      double px = nw / 2, py = (size.h - (height * Min(8, nh))) / (height);
      int x, y, sy;

      nh = Min(nh, 8.0);

      sy = (int)(py/2 + (ny+1) * (py + nh));
      x = (size.w - width * (px + nw)) / 2 + px + nx * (px + nw);
      y = (int)(py/2 + ny * (py + nh));

      surface.background = biasToColor(bias, biasRange);
      surface.Area(x, y, (int)(x + nw-1), (int)(y + nh - 1));
      surface.foreground = gray;
      surface.Rectangle(x, y, (int)(x + nw-1), (int)(y + nh - 1));

      if(axonicSynapses)
      {
         int i;

         for(i = 0; i < axonsCount; i++)
         {
            int sx = (size.w - axonsCount * (spx + snw)) / 2 + spx + i * (spx + snw) + snw/2;
            surface.foreground = weightToColor(axonicSynapses[i], weightRange);
            surface.DrawLine((int)(x + nw/2), (int)(y + nh), sx, sy);
         }
      }
   }
};

static inline ColorAlpha biasToColor(double value, double range)
{
   return ColorHSV { value > 0 ? 120 : 0, 100, (float)(fabs(value) * 100 / range) };
}

static inline ColorAlpha weightToColor(double value, double range)
{
   return ColorHSV { value > 0 ? 240 : 30, 100, (float)(fabs(value) * 100 / range) };
}

class NeuronLayer
{
   uint count;                // number of neurons
   int axonsCount;            // number of neurons of the next layer
   double * axonicSynapses;   // count * axonsCount weights
   double * biases;           // count biases
   double * activations;      // count activations
   double * errors;           // count errors

   void create(int nextLayerCount)
   {
      axonsCount = nextLayerCount;
      activations = new0 double[count];
      errors = new0 double[count];
      biases = new0 double[count];
      axonicSynapses = nextLayerCount ? new0 double[nextLayerCount * count] : null;
   }

   void initialize(bool initBias, bool initWeight, bool random)
   {
      int i, axonsCount = this.axonsCount;
      double * axonicSynapses = this.axonicSynapses;

      for(i = 0; i < count; i++)
      {
         if(initBias)
            biases[i] = random ? GetRandDouble(-0.5, 0.5) : 0;
         if(initWeight)
         {
            int j;

            for(j = 0; j < axonsCount; j++)
            {
               // while(fabs(axonicSynapses[j]) < 0.01)
                  axonicSynapses[j] = random ? GetRandDouble(-0.5, 0.5) : 0.5;
            }
         }
         axonicSynapses += axonsCount;
      }
   }

   void render(Surface surface, Size size, int layer, int numLayers, NeuronLayer nextLayer)
   {
      int i;
      double biasRange = 0.5;
      double weightRange = 0;
      int axonCount = nextLayer ? nextLayer.count : 0;
      const double * axonicSynapses = this.axonicSynapses;

      for(i = 0; i < count; i++)
      {
         if(axonCount)
         {
            int j;

            for(j = 0; j < axonCount; j++)
            {
               double a = fabs(axonicSynapses[j]);
               if(a > weightRange) weightRange = a;
            }
            axonicSynapses += axonCount;
         }
      }

      axonicSynapses = this.axonicSynapses;
      for(i = 0; i < count; i++)
      {
         Neuron::Render(surface, size, layer, numLayers, i, count,
            biasRange, weightRange, axonCount, biases[i], axonicSynapses);
         axonicSynapses += axonCount;
      }
   }

   property int winner
   {
      get { return getWinnerRange(0, count); }
   }

   int getWinnerRange(int start, int count)
   {
      double bestActivation = -MAXDOUBLE;
      int i, best = start;

      if(start + count > this.count)
         return -1;

      for(i = start; i < start + count; i++)
      {
         double activation = activations[i];
         if(activation > bestActivation)
         {
            best = i;
            bestActivation = activation;
         }
      }
      return best;
   }

   ~NeuronLayer()
   {
      delete activations;
      delete errors;
      delete axonicSynapses;
      delete biases;
   }

   void activate(NeuronLayer prevLayer)
   {
      int count = this.count, j;
      const double * prevLayerSynapses = prevLayer.axonicSynapses;
      const double * prevLayerActivations = prevLayer.activations;
      int prevLayerCount = prevLayer.count;

      for(j = 0; j < count; j++)
         activations[j] = Neuron::activate(biases[j], prevLayerSynapses + j, prevLayerActivations, prevLayerCount, count);
   }

   void backPropagate(NeuronLayer nextLayer)
   {
      int count = this.count, j;
      const double * activations = this.activations;
      double * errors = this.errors;

      if(nextLayer)
      {
         const double * nextLayerErrors = nextLayer ? nextLayer.errors : null;
         double * axonicSynapses = this.axonicSynapses;
         int axonsCount = this.axonsCount;
         for(j = 0; j < count; j++, axonicSynapses += axonsCount)
            errors[j] = Neuron::backPropagate(axonicSynapses, nextLayerErrors, axonsCount);
      }
      for(j = 0; j < count; j++)
         if(errors[j])
            errors[j] *= sigmoidDerivative(activations[j]);
   }

   void learn(NeuronLayer prevLayer, double rate)
   {
      double * prevLayerSynapses = prevLayer.axonicSynapses;
      const double * prevLayerActivations = prevLayer.activations;
      const double * errors = this.errors;
      int count = this.count, prevLayerCount = prevLayer.count, j;

      for(j = 0; j < count; j++)
      {
         double errorLearnRate = rate * errors[j];
         Neuron::teach(errorLearnRate, prevLayerActivations, prevLayerSynapses + j, prevLayerCount, count);
         biases[j] += errorLearnRate;
      }
   }
}

class NeuralNet : Array<NeuronLayer>
{
   ~NeuralNet()
   {
      Free();
   }

   void render(Surface surface, Size size)
   {
      int i;

      surface.background = black;
      surface.Clear(colorBuffer);

      for(i = 0; i < count; i++)
         this[i].render(surface, size, i,
            count, i < count - 1 ? this[i + 1] : null);
   }

   void construct(int nInnerLayers, int nInputs, int nOutputs, Container<int> nInner)
   {
      int i, nInnerCount = nInner ? nInner.GetCount() : 0;

      size = nInnerLayers + 2;
      for(i = 0; i < count; i++)
         this[i] = { count =
               i == 0 ? nInputs :
               i == nInnerLayers+1 ? nOutputs :
               nInnerCount ? nInner[Min(nInnerCount-1, i-1)] :
               (nOutputs + nInputs)/2
            };

      for(i = 0; i < count; i++)
         this[i].create(i < count - 1 ? this[i+1].count : 0);
   }

   void initialize(bool random)
   {
      int i;
      uint seed = (uint)(((uint64)(GetTime() * 1000)) & MAXDWORD);

      // seed = 1234567890;

      if(random)
      {
         PrintLn("pseudo-random seed: ", seed);
         RandomSeed(seed);
      }

      for(i = 0; i < count; i++)
         this[i].initialize(i != 0, i != count-1, random);
   }

   void activate(Container<double> inputs)
   {
      int i, inputCount = this[0].count;
      double * inputActivations = this[0].activations;

      for(i = 0; i < inputCount; i++)
         inputActivations[i] = inputs[i];

      for(i = 1; i < count; i++)
         this[i].activate(this[i-1]);
   }

   void doLearning(double learnRate)
   {
      int i;

      for(i = count-1; i >= 0; i--)
         this[i].backPropagate(i < count - 1 ? this[i+1] : null);
      for(i = 1; i < count; i++)
         this[i].learn(this[i-1], learnRate);
   }

   void learn(int expected, double learnRate)
   {
      NeuronLayer output = this[count-1];
      double * errors = output.errors;
      const double * activations = output.activations;
      int i, outputCount = output.count;

      for(i = 0; i < outputCount; i++)
      {
         bool fired = expected == i;
         errors[i] = (double)fired - activations[i];
      }

      doLearning(learnRate);
   }

   void learnMulti(int num, int * expected, double learnRate)
   {
      NeuronLayer output = this[count-1];
      double * errors = output.errors;
      const double * activations = output.activations;
      int i, outputCount = output.count;

      for(i = 0; i < outputCount; i++)
      {
         int j;
         bool fired = false;
         for(j = 0; j < num; j++)
         {
            if(expected[j] == i)
            {
               fired = true;
               break;
            }
         }
         errors[i] = (double)fired - activations[i];
      }

      doLearning(learnRate);
   }

   void learnValues(Array<double> values, double learnRate)
   {
      NeuronLayer output = this[count-1];
      double * errors = output.errors;
      const double * activations = output.activations;
      int i, outputCount = output.count;

      for(i = 0; i < outputCount; i++)
         errors[i] = values[i] - activations[i];

      doLearning(learnRate);
   }


   property int winner { get { return this[count-1].winner; } }

   int getWinnerRange(int start, int count)
   {
      return this[this.count-1].getWinnerRange(start, count);
   }

   void save(File f)
   {
      int i;

      f.Put(this.count);
      for(i = 0; i < count; i++)
      {
         NeuronLayer layer = this[i];
         f.Put(layer.count);
      }
      for(i = 0; i < count; i++)
      {
         NeuronLayer layer = this[i];
         int j, axonsCount = layer.axonsCount;
         const double * axons = layer.axonicSynapses;
         for(j = 0; j < layer.count; j++)
         {
            int k;

            f.Put(layer.biases[j]);
            for(k = 0; k < axonsCount; k++)
               f.Put(axons[k]);

            axons += axonsCount;
         }
      }
   }

   bool saveTo(const String fileName)
   {
      bool result = false;
      File f = FileOpen(fileName, write);
      if(f)
      {
         save(f);
         delete f;
         result = true;
      }
      return result;
   }

   bool loadFrom(const String fileName)
   {
      bool result = false;
      File f = FileOpen(fileName, read);
      if(f)
      {
         result = load(f);
         delete f;
      }
      return result;
   }

   bool load(File f)
   {
      bool result = false;
      int numLayers = 0, inputCount = 0;

      f.Get(numLayers);
      f.Get(inputCount);

      if(numLayers >= 2 && inputCount &&
         (!count || count == numLayers) &&
         (!count || this[0].count == inputCount))
      {
         Array<int> innerCounts { };
         int i, outputCount;
         bool mismatchedInnerCount = false;

         innerCounts.size = numLayers - 2;

         for(i = 0; i < numLayers - 2; i++)
         {
            f.Get(innerCounts[i]);
            if(count && innerCounts[i] != this[i + 1].count)
            {
               mismatchedInnerCount = true;
               break;
            }
         }

         f.Get(outputCount);

         if(!mismatchedInnerCount && outputCount && (!count || this[count-1].count == outputCount))
         {
            if(!count)
               construct(numLayers - 2, inputCount, outputCount, innerCounts);

            for(i = 0; i < count; i++)
            {
               NeuronLayer layer = this[i];
               int j, axonsCount = layer.axonsCount;
               double * axons = layer.axonicSynapses;
               for(j = 0; j < layer.count; j++)
               {
                  int k;

                  f.Get(layer.biases[j]);
                  for(k = 0; k < axonsCount; k++)
                     f.Get(axons[k]);
                  axons += axonsCount;
               }
            }
            result = true;
         }
         delete innerCounts;
      }
      return result;
   }
}

class NeuralNetView : Window
{
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   borderStyle = sizable;
   anchor = { left = 0, top = 0, right = 0.566, bottom = 0.25 };
   font = { "Arial", 12, bold = true };

   void writeLabels(Surface surface, Size size, bool input)
   {
      int height = nn.count;
      int ny = input ? 0 : height-1;
      NeuronLayer layer = nn[ny];
      int width = layer.count;
      Array<const String> labels = input ? inputLabels : outputLabels;
      if(labels.count == width)
      {
         int i;
         double nw = Max(1, size.w / (2*width+1));  // Width of one neuron
         double nh = Max(1, size.h / (3+1));        // Height of one neuron
         double px = nw / 2, py = (size.h - (height * Min(8, nh))) / height;
         int x, y;
         int mod = Min(3, Max(1, width / 10));

         nh = Min(nh, 8.0);
         x = (size.w - width * (px + nw)) / 2 + 2*px;
         y = (int)(py/2 + ny * (py + nh) + nh * (input ? (-3*mod) : 1));

         surface.foreground = white;
         for(i = 0; i < width; i++, x += (px + nw))
         {
            const String t = labels[i];
            surface.CenterTextf(x, y + (i % mod) * 20, t, strlen(t));
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      nn.render(surface, clientSize);
      if(nn.count)
      {
         writeLabels(surface, clientSize, false);
         writeLabels(surface, clientSize, true);
      }
   }
public:
   Array<const String> inputLabels { };
   Array<const String> outputLabels { };
   NeuralNet nn;
}
