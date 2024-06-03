import "ecere"

#include <math.h>

#define floatType double
// #define floatType float

private static inline floatType sigmoid(floatType x)
{
   return 1 / (1 + exp(-x));
}

private static inline floatType sigmoidDerivative(floatType x)
{
   return x * (1 - x);
}

floatType GetRandDouble(floatType lo, floatType hi)
{
   return GetRandom((int)(lo * 1000000000), (int)(hi * 1000000000)) / 1000000000.0f;
}

struct Neuron
{
   int dummy;

   floatType ::activate(floatType bias, const floatType * prevLayerSynapses, const floatType * prevLayerActivations, int dendronsCount) // Feed-forward algorithm
   {
      floatType sum = bias;
      int i;
      for(i = 0; i < dendronsCount; i++)
         sum += prevLayerActivations[i] * prevLayerSynapses[i];
      return sigmoid(sum);
   }

   // NOTE: this is not called on the final output layer
   floatType ::backPropagate(const floatType * synapticWeights, const floatType * nextLayerErrors, int axonsCount)
   {
      floatType error = 0;
      int i;

      for(i = 0; i < axonsCount; i++)
         error += nextLayerErrors[i] * synapticWeights[i];
      return error;
   }
                                                                                                  // number of neurons in previous layer
   void ::teach(floatType errorLearnRate, const floatType * prevLayerActivations, floatType * prevLayerSynapses, int dendronsCount, int nCount)
   {
      if(errorLearnRate)
      {
         int i;

         for(i = 0; i < dendronsCount; i++)
            prevLayerSynapses[i] += errorLearnRate * prevLayerActivations[i];
      }
   }

   void ::Render(Surface surface, Size size, int ny, int height, int nx, int width,
      floatType biasRange, floatType weightRange, int axonsCount, floatType bias, const floatType * axonicSynapses, int nCount)
   {
      floatType nw = Max(1, size.w / (2*width+1));     // Width of one neuron
      floatType nh = Max(1, size.h / (height+1));        // Height of one neuron
      floatType snw = Max(1, size.w / (2*axonsCount+1));   // Synapse width
      floatType spx = snw / 2;
      floatType px = nw / 2, py = (size.h - (height * Min(8, nh))) / (height);
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
            surface.foreground = weightToColor(axonicSynapses[i * nCount], weightRange);
            surface.DrawLine((int)(x + nw/2), (int)(y + nh), sx, sy);
         }
      }
   }
};

static inline ColorAlpha biasToColor(floatType value, floatType range)
{
   return ColorHSV { value > 0 ? 120 : 0, 100, (float)(fabs(value) * 100 / range) };
}

static inline ColorAlpha weightToColor(floatType value, floatType range)
{
   return ColorHSV { value > 0 ? 240 : 30, 100, (float)(fabs(value) * 100 / range) };
}

class NeuronLayer
{
   uint count;                // number of neurons
   int axonsCount;            // number of neurons of the next layer
   floatType * axonicSynapses;   // axonsCount * count weights (now the weights from all neurons of this layer to a neuron of next layer are contiguous)
   floatType * biases;           // count biases
   floatType * activations;      // count activations
   floatType * errors;           // count errors
   floatType * tempNeuronSynapses;  // Temporary contiguous copy of synaptic weights for one neuron for backPropagate()

   void create(int nextLayerCount)
   {
      axonsCount = nextLayerCount;
      activations = new0 floatType[count];
      errors = new0 floatType[count];
      biases = new0 floatType[count];
      axonicSynapses = nextLayerCount ? new0 floatType[nextLayerCount * count] : null;
      tempNeuronSynapses = new0 floatType[axonsCount];
   }

   void initialize(bool initBias, bool initWeight, bool random)
   {
      int i, axonsCount = this.axonsCount;
      floatType * axonicSynapses = this.axonicSynapses;

      for(i = 0; i < count; i++)
      {
         if(initBias)
            biases[i] = random ? GetRandDouble(-0.5f, 0.5f) : 0;
         if(initWeight)
         {
            int j;

            for(j = 0; j < axonsCount; j++)
            {
               while(fabs(axonicSynapses[j * count + i]) < 0.01)
                  axonicSynapses[j * count + i] = random ? GetRandDouble(-0.5f, 0.5f) : 0.5f;
            }
         }
      }
   }

   void render(Surface surface, Size size, int layer, int numLayers, NeuronLayer nextLayer)
   {
      int i;
      floatType biasRange = 0.5;
      floatType weightRange = 0;
      int axonCount = nextLayer ? nextLayer.count : 0;
      const floatType * axonicSynapses = this.axonicSynapses;

      for(i = 0; i < count; i++)
      {
         if(axonCount)
         {
            int j;

            for(j = 0; j < axonCount; j++)
            {
               floatType a = fabs(axonicSynapses[j * count + i]);
               if(a > weightRange) weightRange = a;
            }
         }
      }

      axonicSynapses = this.axonicSynapses;
      for(i = 0; i < count; i++)
      {
         Neuron::Render(surface, size, layer, numLayers, i, count,
            biasRange, weightRange, axonCount, biases[i], axonicSynapses + i, count);
      }
   }

   property int winner
   {
      get { return getWinnerRange(0, count); }
   }

   int getWinnerRange(int start, int count)
   {
      floatType bestActivation = -MAXFLOAT; //MAXDOUBLE;
      int i, best = start;

      if(start + count > this.count)
         return -1;

      for(i = start; i < start + count; i++)
      {
         floatType activation = activations[i];
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
      delete tempNeuronSynapses;
   }

   void activate(NeuronLayer prevLayer)
   {
      int count = this.count, j;
      const floatType * prevLayerSynapses = prevLayer.axonicSynapses;
      const floatType * prevLayerActivations = prevLayer.activations;
      int prevLayerCount = prevLayer.count;

      for(j = 0; j < count; j++)
         activations[j] = Neuron::activate(biases[j], prevLayerSynapses + j * prevLayerCount, prevLayerActivations, prevLayerCount);
   }

   void backPropagate(NeuronLayer nextLayer)
   {
      int count = this.count, j;
      const floatType * activations = this.activations;
      floatType * errors = this.errors;

      if(nextLayer)
      {
         const floatType * nextLayerErrors = nextLayer ? nextLayer.errors : null;
         const floatType * axonicSynapses = this.axonicSynapses;
         int axonsCount = this.axonsCount;
         floatType * tempNeuronSynapses = this.tempNeuronSynapses;

         for(j = 0; j < count; j++)
         {
            int k;
            const floatType * synapse = axonicSynapses + j;

            for(k = 0; k < axonsCount; k++, synapse += count)
               tempNeuronSynapses[k] = *synapse;
            errors[j] = Neuron::backPropagate(tempNeuronSynapses, nextLayerErrors, axonsCount);
         }
      }
      for(j = 0; j < count; j++)
         if(errors[j])
            errors[j] *= sigmoidDerivative(activations[j]);
   }

   void learn(NeuronLayer prevLayer, floatType rate)
   {
      floatType * prevLayerSynapses = prevLayer.axonicSynapses;
      const floatType * prevLayerActivations = prevLayer.activations;
      const floatType * errors = this.errors;
      int count = this.count, prevLayerCount = prevLayer.count, j;

      for(j = 0; j < count; j++)
      {
         floatType errorLearnRate = rate * errors[j];
         Neuron::teach(errorLearnRate, prevLayerActivations, prevLayerSynapses + j * prevLayerCount, prevLayerCount, count);
         biases[j] += errorLearnRate; ///*0.25 * */errorLearnRate * sigmoidDerivative(activations[j]);
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

   void activate(Container<floatType> inputs)
   {
      int i, inputCount = this[0].count;
      floatType * inputActivations = this[0].activations;

      for(i = 0; i < inputCount; i++)
         inputActivations[i] = inputs[i];

      for(i = 1; i < count; i++)
         this[i].activate(this[i-1]);
   }

   void doLearning(floatType learnRate)
   {
      int i;

      for(i = count-1; i >= 0; i--)
         this[i].backPropagate(i < count - 1 ? this[i+1] : null);
      for(i = 1; i < count; i++)
         this[i].learn(this[i-1], learnRate);
   }

   void learn(int expected, floatType learnRate)
   {
      NeuronLayer output = this[count-1];
      floatType * errors = output.errors;
      const floatType * activations = output.activations;
      int i, outputCount = output.count;

      for(i = 0; i < outputCount; i++)
      {
         bool fired = expected == i;
         errors[i] = (floatType)fired - activations[i];
      }

      doLearning(learnRate);
   }

   void learnMulti(int num, int * expected, floatType learnRate)
   {
      NeuronLayer output = this[count-1];
      floatType * errors = output.errors;
      const floatType * activations = output.activations;
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
         errors[i] = (floatType)fired - activations[i];
      }

      doLearning(learnRate);
   }

   void learnValues(Array<floatType> values, floatType learnRate)
   {
      NeuronLayer output = this[count-1];
      floatType * errors = output.errors;
      const floatType * activations = output.activations;
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
         const floatType * axons = layer.axonicSynapses;
         floatType * temp = new floatType[layer.count * axonsCount];

         if(axonsCount)
         {
            int k;

            for(j = 0; j < layer.count; j++)
               for(k = 0; k < axonsCount; k++)
                  temp[j * axonsCount + k] =
                     axons[k * layer.count + j];
            axons = temp;
         }

         for(j = 0; j < layer.count; j++)
         {
            int k;

            f.Put(layer.biases[j]);
            for(k = 0; k < axonsCount; k++)
               f.Put(axons[k]);

            axons += axonsCount;
         }
         delete temp;
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
               floatType * axons = layer.axonicSynapses;
               for(j = 0; j < layer.count; j++)
               {
                  int k;

                  f.Get(layer.biases[j]);
                  for(k = 0; k < axonsCount; k++)
                     f.Get(axons[k]);
                  axons += axonsCount;
               }

               if(axonsCount)
               {
                  floatType * temp = new floatType[layer.count * axonsCount];
                  int k;

                  for(j = 0; j < layer.count; j++)
                     for(k = 0; k < axonsCount; k++)
                        temp[k * layer.count + j] =
                           layer.axonicSynapses[j * axonsCount + k];
                  memcpy(layer.axonicSynapses, temp, layer.count * axonsCount * sizeof(floatType));
                  delete temp;
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
         floatType nw = Max(1, size.w / (2*width+1));  // Width of one neuron
         floatType nh = Max(1, size.h / (3+1));        // Height of one neuron
         floatType px = nw / 2, py = (size.h - (height * Min(8, nh))) / height;
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
