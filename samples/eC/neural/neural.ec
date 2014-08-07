import "neurons"

enum Behavior
{
   RUN,
   HIDE,
   WANDER,
   ATTACK
};

enum Health
{
   POOR,
   OK,
   GOOD
};

struct Example
{
   Health health;
   bool hasKnife;
   bool hasGun;
   int ennemies;
   Behavior result;
};

static Example examples[] =
{
   { GOOD, false,false, 0, WANDER },
   { GOOD, false,false, 1, WANDER },
   { GOOD, false,true,  1, ATTACK },
   { GOOD, false,true,  2, ATTACK },
   { GOOD, true, false, 2, HIDE   },
   { GOOD, true, false, 1, ATTACK },
   { OK,   false,false, 0, WANDER },
   { OK,   false,false, 1, HIDE   },
   { OK,   false,true,  1, ATTACK },
   { OK,   false,true,  2, HIDE   },
   { OK,   true, false, 2, HIDE   },
   { OK,   true, false, 1, HIDE   },
   { POOR, false,false, 0, WANDER },
   { POOR, false,false, 1, HIDE   },
   { POOR, false,true,  1, HIDE   },
   { POOR, false,true,  2, RUN    },
   { POOR, true, false, 2, RUN    },
   { POOR, true, false, 1, HIDE   }
};

const char * behaviors[4] = { "Run", "Hide", "Wander", "Attack" };

#define NUM_EXAMPLES (sizeof(examples) / sizeof(Example))

static Example tests[] =
{
   { GOOD, true, true, 1 },
   { OK,   true, true, 2 },
   { POOR, false,false,0 },
   { POOR, true, true, 1 },
   { GOOD, false,true, 3 },
   { GOOD, true, false,3 },
   { POOR, true, false,3 }
};

#define NUM_TESTS (sizeof(tests) / sizeof(Example))

#define NUM_ITERATIONS  6000

#define LEARN_RATE   0.2

#define NUM_INPUT    4
#define NUM_HIDDEN   3
#define NUM_OUTPUT   4

static Neuron inputNeurons[NUM_INPUT];
static Neuron hiddenNeurons[NUM_HIDDEN];
static Neuron outputNeurons[NUM_OUTPUT];

class NeuralApp : Application
{
   void Main()
   {
      // ********** CONSTRUCT NEURAL NETWORK *****************
      int i,h,o;
      int c;

      RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));
      // Input to hidden cells synapses
      for(i = 0; i<NUM_HIDDEN; i++)
         hiddenNeurons[i].Init();
      for(i = 0; i<NUM_OUTPUT; i++)
         outputNeurons[i].Init();
      for(i = 0; i<NUM_INPUT; i++)
      {
         Neuron * input = &inputNeurons[i];

         input->Init();
         input->axons.size = NUM_HIDDEN;
         for(h = 0; h<NUM_HIDDEN; h++)
         {
            Neuron * hidden = &hiddenNeurons[h];
            Synapse * synapse = &input->axons[h];

            if(!hidden->dendrons.size)
               hidden->dendrons.size = NUM_INPUT;
            hidden->dendrons[i].ptr = synapse;

            synapse->dendron = input;
            synapse->axon = hidden;
            synapse->weight = GetRandDouble(-0.5, 0.5);
         }
      }

      // Hidden to output cells synapses
      for(h = 0; h<NUM_HIDDEN; h++)
      {
         Neuron * hidden = &hiddenNeurons[h];

         hidden->axons.size = NUM_OUTPUT;
         for(o = 0; o<NUM_OUTPUT; o++)
         {
            Neuron * output = &outputNeurons[o];
            Synapse * synapse = &hidden->axons[o];

            if(!output->dendrons.size)
               output->dendrons.size = NUM_HIDDEN;
            output->dendrons[h].ptr = synapse;

            synapse->dendron = hidden;
            synapse->axon = output;
            synapse->weight = GetRandDouble(-0.5, 0.5);
         }
         hidden->bias = GetRandDouble(-0.5, 0.5);
      }

      // Output cells
      for(o = 0; o<NUM_OUTPUT; o++)
      {
         Neuron * output = &outputNeurons[o];
         output->bias = GetRandDouble(-0.5, 0.5);
      }

      // ********** TRAIN NEURAL NETWORK *****************
      for(i = 0; i<NUM_ITERATIONS; i++)
      {
         int e;
         for(e = 0; e<NUM_EXAMPLES; e++)
         {
            Example * example = &examples[e];

            for(c = 0; c<NUM_OUTPUT; c++)
               outputNeurons[c].Unactivate();

            inputNeurons[0].activation = (double)example->health;
            inputNeurons[1].activation = (double)example->hasKnife;
            inputNeurons[2].activation = (double)example->hasGun;
            inputNeurons[3].activation = example->ennemies;
            for(c = 0; c<NUM_OUTPUT; c++)
               outputNeurons[c].Activate();

            for(c = 0; c<NUM_OUTPUT; c++)
               outputNeurons[c].error = (double)((int)example->result == c) - outputNeurons[c].activation;

            for(c = 0; c<NUM_INPUT; c++)
               inputNeurons[c].BackPropagate();
            for(c = 0; c<NUM_OUTPUT; c++)
               outputNeurons[c].Teach(LEARN_RATE);
         }
      }

      // ********** TEST NEURAL NETWORK *****************
      for(c = 0; c<NUM_EXAMPLES; c++)
      {
         Example * example = &examples[c];
         int winner;

         for(o = 0; o<NUM_OUTPUT; o++)
            outputNeurons[o].Unactivate();

         inputNeurons[0].activation = (double)example->health;
         inputNeurons[1].activation = (double)example->hasKnife;
         inputNeurons[2].activation = (double)example->hasGun;
         inputNeurons[3].activation = example->ennemies;

         for(o = 0; o<NUM_OUTPUT; o++)
            outputNeurons[o].Activate();

         winner = Neuron_Winner(outputNeurons, NUM_OUTPUT);
         printf("%s\n", behaviors[winner]);
      }

      // ********** UNKNOWN TEST CASES *****************
      printf("\n\nUnknown Cases:\n\n");
      for(c = 0; c<NUM_TESTS; c++)
      {
         Example * example = &tests[c];
         int winner;

         for(o = 0; o<NUM_OUTPUT; o++)
            outputNeurons[o].Unactivate();

         inputNeurons[0].activation = (double)example->health;
         inputNeurons[1].activation = (double)example->hasKnife;
         inputNeurons[2].activation = (double)example->hasGun;
         inputNeurons[3].activation = example->ennemies;

         for(o = 0; o<NUM_OUTPUT; o++)
            outputNeurons[o].Activate();

         winner = Neuron_Winner(outputNeurons, NUM_OUTPUT);
         printf("%s\n", behaviors[winner]);
      }
#if defined(__WIN32__)
      system("pause");
#endif
   }
}
