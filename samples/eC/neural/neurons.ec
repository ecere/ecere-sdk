import "ecere"

struct Synapse
{
   double weight;
   Neuron * dendron; // towards input...
   Neuron * axon;    // towards output...
};

// #define USE_STATES

#ifdef USE_STATES

enum NeuronState
{
   cleared,
   activated,
   propagated,
   taught
};

#endif

struct SynapsePtr
{
   Synapse * ptr; // TOFIX: Support pointers in generic types
};

static inline double Sigmoid(double x)
{
   return 1 / (1 + exp(-x));
}

static inline double SigmoidDerivative(double x)
{
   return x * (1 - x);
}

double GetRandDouble(double lo, double hi)
{
   return GetRandom((int)(lo * 1000000000), (int)(hi * 1000000000)) / 1000000000.0;
}

struct Neuron
{
   double bias;
   Array<Synapse> axons;
   Array<SynapsePtr> dendrons;
   double activation;
   double error;
#ifdef USE_STATES
   NeuronState state;
#endif

   void Init()
   {
      axons = { };
      dendrons = { };
   }

   void OnFree()
   {
      delete axons;
      delete dendrons;
   }

#ifdef USE_STATES
   void Unactivate()
   {
      int c;
      uint dendronsCount = dendrons.count;
      for(c = 0; c < dendronsCount; c++)
      {
         Synapse * synapse = dendrons[c].ptr;
         if(synapse->dendron->state != cleared)
            synapse->dendron->Unactivate();
      }
      state = cleared;
   }
#endif

   void Activate() // Feed-forward algorithm
   {
      uint dendronsCount = dendrons.count;
#ifdef USE_STATES
      if(dendronsCount)
#endif
      {
         double sum = bias;
         int c;
         for(c = 0; c < dendronsCount; c++)
         {
            Synapse * synapse = dendrons[c].ptr;
            Neuron * dendron = synapse->dendron;
#ifdef USE_STATES
            if(dendron->state != activated)
               dendron->Activate();
#endif
            sum += dendron->activation * synapse->weight;
         }
         activation = Sigmoid(sum);
      }
#ifdef USE_STATES
      state = activated;
#endif
   }

   void BackPropagate()
   {
      int c;

      uint axonsCount = axons.count;
      if(axonsCount)
      {
         double err = 0;
         for(c = 0; c < axonsCount; c++)
         {
            Synapse * synapse = &axons[c];
            Neuron * axon = synapse->axon;
#ifdef USE_STATES
            if(axon->state != propagated)
               axon->BackPropagate();
#endif
            err += axon->error * synapse->weight;
         }
         error = err;
      }
      if(error)
         error *= SigmoidDerivative(activation);
#ifdef USE_STATES
      state = propagated;
#endif
   }

   void Teach(double learnRate)
   {
      int i;
      uint dendronsCount = dendrons.count;

      if(error)
      {
#ifdef USE_STATES
         if(dendronsCount)
#endif
         {
            double lrErr = learnRate * error;
            for(i = 0; i < dendronsCount; i++)
            {
               Synapse * synapse = dendrons[i].ptr;
               Neuron * dendron = synapse->dendron;
#ifdef USE_STATES
               if(state != taught)
                  dendron->Teach(learnRate);
#endif
               synapse->weight += lrErr * dendron->activation;
            }
            bias += lrErr;
         }
#ifdef USE_STATES
         state = taught;
#endif
      }
   }

   void Render(Surface surface, Size size, int ny, int height, int nx, int width, int nextWidth,
      double biasRange, double weightRange)
   {
      double nw = Max(1, size.w / (2*width+1));     // Width of one neuron
      double nh = Max(1, size.h / (height+1));        // Height of one neuron
      double snw = Max(1, size.w / (2*nextWidth+1));   // Synapse width
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

      if(axons)
      {
         int i;

         for(i = 0; i < axons.count; i++)
         {
            int sx = (size.w - nextWidth * (spx + snw)) / 2 + spx + i * (spx + snw) + snw/2;
            Synapse * synapse = &axons[i];
            surface.foreground = weightToColor(synapse->weight, weightRange);
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

class NeuronLayer : Array<Neuron>
{
   void create()
   {
      int i;

      for(i = 0; i < count; i++)
         this[i].Init();
   }

   void initialize(bool initBias, bool initWeight, bool random)
   {
      int i;

      for(i = 0; i < count; i++)
      {
         Neuron * neuron = &this[i];
         if(initBias)
            neuron->bias = random ? GetRandDouble(-0.5, 0.5) : 0;
         if(initWeight)
         {
            int j, count = neuron->axons.count;

            for(j = 0; j < count; j++)
            {
               Synapse * synapse = &neuron->axons[j];
               synapse->weight = random ? GetRandDouble(-0.5, 0.5) : 0.5;
            }
         }
      }
   }

   void link(NeuronLayer next)
   {
      int i;

      // Synapses from this layer to the next
      for(i = 0; i < count; i++)
      {
         Neuron * neuron = &this[i];
         int j;

         neuron->axons.size = next.count;
         for(j = 0; j < next.count; j++)
         {
            Neuron * nextNeuron = &next[j];
            Synapse * synapse = &neuron->axons[j];

            if(!nextNeuron->dendrons.size)
               nextNeuron->dendrons.size = count;
            nextNeuron->dendrons[i].ptr = synapse;

            synapse->dendron = neuron;
            synapse->axon = nextNeuron;
         }
      }
   }

   void render(Surface surface, Size size, int layer, int numLayers, NeuronLayer nextLayer)
   {
      int i;
      double biasRange = 0.5;
      double weightRange = 0;

      for(i = 0; i < count; i++)
      {
         Neuron * neuron = &this[i];
         if(neuron->axons)
         {
            int j;

            for(j = 0; j < neuron->axons.count; j++)
            {
               Synapse * synapse = &neuron->axons[j];
               double a = fabs(synapse->weight);
               if(a > weightRange) weightRange = a;
            }
         }
      }

      for(i = 0; i < count; i++)
         this[i].Render(surface, size, layer, numLayers, i, count,
            nextLayer ? nextLayer.count : 0, biasRange, weightRange);
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
         Neuron * neuron = &this[i];
         if(neuron->activation > bestActivation)
         {
            best = i;
            bestActivation = neuron->activation;
         }
      }
      return best;
   }

   ~NeuronLayer()
   {
      Free();
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
      {
         this[i] = { size =
               i == 0 ? nInputs :
               i == nInnerLayers+1 ? nOutputs :
               nInnerCount ? nInner[Min(nInnerCount-1, i-1)] :
               (nOutputs + nInputs)/2
            };
         this[i].create();
         if(i)
            this[i-1].link(this[i]);
      }
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
      NeuronLayer input = this[0];
      int i;

#ifdef USE_STATES
      NeuronLayer output = this[count-1];
      for(i = 0; i < output.count; i++)
         output[i].Unactivate();
#endif

      for(i = 0; i < input.count; i++)
         input[i].activation = inputs[i];

#ifdef USE_STATES
      for(i = 0; i < output.count; i++)
         output[i].Activate();
#else
      for(i = 1; i < count; i++)
      {
         NeuronLayer layer = this[i];
         int j;
         for(j = 0; j < layer.count; j++)
            layer[j].Activate();
      }
#endif
   }

   void doLearning(double learnRate)
   {
      int i;

#ifdef USE_STATES
      NeuronLayer input = this[0];
      NeuronLayer output = this[count-1];

      for(i = 0; i < input.count; i++)
        input[i].BackPropagate();

      for(i = 0; i < output.count; i++)
         output[i].Teach(learnRate);
#else
      for(i = count-1; i >= 0; i--)
      {
         NeuronLayer layer = this[i];
         int j;
         for(j = 0; j < layer.count; j++)
            layer[j].BackPropagate();
      }

      for(i = 1; i < count; i++)
      {
         NeuronLayer layer = this[i];
         int j;
         for(j = 0; j < layer.count; j++)
            layer[j].Teach(learnRate);
      }
#endif
   }

   void learn(int expected, double learnRate)
   {
      NeuronLayer output = this[count-1];
      int i;

      for(i = 0; i < output.count; i++)
      {
         Neuron * neuron = &output[i];
         bool fired = expected == i;
         neuron->error = (double)fired - neuron->activation;
      }

      doLearning(learnRate);
   }

   void learnMulti(int num, int * expected, double learnRate)
   {
      NeuronLayer output = this[count-1];
      int i;

      for(i = 0; i < output.count; i++)
      {
         Neuron * neuron = &output[i];
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
         neuron->error = (double)fired - neuron->activation;
      }

      doLearning(learnRate);
   }

   void learnValues(Array<double> values, double learnRate)
   {
      NeuronLayer output = this[count-1];
      int i;

      for(i = 0; i < output.count; i++)
      {
         Neuron * neuron = &output[i];
         int j;
         double value = values[i];
         neuron->error = value - neuron->activation;
      }

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
         int j;
         for(j = 0; j < layer.count; j++)
         {
            const Neuron * neuron = &layer[j];
            Array<Synapse> axons = neuron->axons;
            int k;

            f.Put(neuron->bias);
            for(k = 0; k < axons.count; k++)
               f.Put(axons[k].weight);
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
               int j;
               for(j = 0; j < layer.count; j++)
               {
                  const Neuron * neuron = &layer[j];
                  Array<Synapse> axons = neuron->axons;
                  int k;

                  f.Get(neuron->bias);
                  for(k = 0; k < axons.count; k++)
                     f.Get(axons[k].weight);
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
