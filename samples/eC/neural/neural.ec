import "neurons"

enum Behavior { run, hide, wander, attack };

enum Health { poor, ok, good };

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
   { good, false,false, 0, wander },
   { good, false,false, 1, wander },
   { good, false,true,  1, attack },
   { good, false,true,  2, attack },
   { good, true, false, 2, hide   },
   { good, true, false, 1, attack },
   { ok,   false,false, 0, wander },
   { ok,   false,false, 1, hide   },
   { ok,   false,true,  1, attack },
   { ok,   false,true,  2, hide   },
   { ok,   true, false, 2, hide   },
   { ok,   true, false, 1, hide   },
   { poor, false,false, 0, wander },
   { poor, false,false, 1, hide   },
   { poor, false,true,  1, hide   },
   { poor, false,true,  2, run    },
   { poor, true, false, 2, run    },
   { poor, true, false, 1, hide   }
};
define numExamples = sizeof(examples) / sizeof(Example);

static Example tests[] =
{
   { good, true, true, 1 },
   { ok,   true, true, 2 },
   { poor, false,false,0 },
   { poor, true, true, 1 },
   { good, false,true, 3 },
   { good, true, false,3 },
   { poor, true, false,3 }
};
define numTests = sizeof(tests) / sizeof(Example);

NeuralNet nn { };

class NeuralApp : GuiApplication
{
   bool Init()
   {
      int i;
      bool wellTrained = false;

      // ********** CONSTRUCT NEURAL NETWORK *****************
      nn.construct(1, 4, 4, [ 3 ]);

      while(!wellTrained)
      {
         nn.initialize(true);

         // ********** TRAIN NEURAL NETWORK *****************
         for(i = 0; i < 6000; i++)
         {
            int j;
            for(j = 0; j < numExamples; j++)
            {
               Example * example = &examples[j];
               nn.activate([ (double)example->health, (double)example->hasKnife, (double)example->hasGun, example->ennemies ]);
               nn.learn(example->result, 0.2);
            }
         }

         // ********** TEST NEURAL NETWORK *****************
         for(i = 0; i < numExamples; i++)
         {
            Example * example = &examples[i];
            Behavior winner;
            nn.activate([ (double)example->health, (double)example->hasKnife, (double)example->hasGun, example->ennemies ]);
            winner = (Behavior)nn.winner;
            PrintLn(winner);
            if(winner != example->result)
            {
               PrintLn("WARNING: Test failed for scenario ", *example, ", re-training");
               break;
            }
         }
         if(i == numExamples)
            wellTrained = true;
      }

      // ********** UNKNOWN TEST CASES *****************
      PrintLn("\n\nUnknown Cases:\n");
      for(i = 0; i < numTests; i++)
      {
         Example * example = &tests[i];
         nn.activate([ (double)example->health, (double)example->hasKnife, (double)example->hasGun, example->ennemies ]);
         PrintLn((Behavior)nn.winner);
      }
      return true;
   }
}

NeuralNetView netView
{
   nn = nn;
                        // FIXME: warnings even though array is declared <const String>
   inputLabels.copySrc = [ (String)"health", (String)"hasKnife", (String)"hasGun", (String)"ennemies" ];
   outputLabels.copySrc = [ (String)"run", (String)"hide", (String)"wander", (String)"attack" ];
};
