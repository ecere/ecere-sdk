import "ecere"

struct Synapse
{
   double weight;
   Neuron * dendron;
   Neuron * axon;
};

enum NeuronState
{
   CLEARED,
   ACTIVATED,
   PROPAGATED,
   TAUGHT
};

struct SynapsePtr
{
   Synapse * ptr; // TOFIX: Support pointers in generic types
};

static double Sigmoid(double x)
{
   return 1 / (1 + exp(-x));
}

static double SigmoidDerivative(double x)
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
   NeuronState state;

   void Init()
   {
      axons = { };
      dendrons = { };
   }

   void Unactivate()
   {
      int c;
      for(c = 0; c<dendrons.size; c++)
      {
         Synapse * synapse = dendrons[c].ptr;
         if(synapse->dendron->state != CLEARED)
            synapse->dendron->Unactivate();
      }
      state = CLEARED;
   }

   void Activate()
   {
      if(dendrons.size)
      {
         int c;
         activation = bias;
         for(c = 0; c<dendrons.size; c++)
         {
            Synapse * synapse = dendrons[c].ptr;
            if(synapse->dendron->state != ACTIVATED)
               synapse->dendron->Activate();
            activation += synapse->dendron->activation * synapse->weight;
         }
         activation = Sigmoid(activation);
      }
      state = ACTIVATED;
   }

   void BackPropagate()
   {
      int c;
      if(axons.size)
      {
         error = 0;
         for(c = 0; c<axons.size; c++)
         {
            Synapse * synapse = &axons[c];
            if(synapse->axon->state != PROPAGATED)
               synapse->axon->BackPropagate();
            error += synapse->axon->error * synapse->weight;
         }
      }
      error *= SigmoidDerivative(activation);
      state = PROPAGATED;
   }

   void Teach(double learnRate)
   {
      int c;
      if(dendrons.size)
      {
         for(c = 0; c<dendrons.size; c++)
         {
            Synapse * synapse = dendrons[c].ptr;
            if(state != TAUGHT)
               synapse->dendron->Teach(learnRate);
            synapse->weight += learnRate * error * synapse->dendron->activation;
         }
         bias += learnRate * error;
      }
      state = TAUGHT;
   }
};

int Neuron_Winner(Neuron * neurons, int count)
{
   double bestActivation = -MAXDOUBLE;
   int c, best;
   for(c = 0; c<count; c++)
   {
      if(neurons[c].activation > bestActivation)
      {
         best = c;
         bestActivation = neurons[c].activation;
      }
   }
   return best;
}
