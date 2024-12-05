import java.util.List;
import java.util.LinkedList;
import java.util.concurrent.Future;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ExecutionException;

public class CountPool {
    static private final int VMIN = 0;
    static private final int VMAX = 9;

    static class PartialCount implements Callable<Integer> {
        private int start;
        private int end;
        private int[] array;

        PartialCount(int[] array, int start, int end) {
            this.array = array;
            this.start = start;
            this.end = end;
        }

        @Override
        public Integer call() {
            if ((array[end-1] < VMIN) || (array[start] > VMAX))
              return 0;
            return LargeIntArray.count(array, start, end, VMIN, VMAX);
        }
    }

    /** Le tableau est découpé en numberOfTasks tronçons, chacun soumis à l'executor. */
    private static int computeCount(ExecutorService executor, int[] array, int numberOfTasks) throws InterruptedException, ExecutionException {
        int taskSize = Math.max(1, array.length / numberOfTasks); // nb d'éléments traîtés par une tâche
        List<Future<Integer>> results = new LinkedList<>();

        // Créer et soumettre les tâches
        for (int i = 0; i <= numberOfTasks-1; i++ ) {
            results.add(executor.submit(new PartialCount(array, i*taskSize, (i+1)*taskSize)));
        }
        results.add(executor.submit(new PartialCount(array, taskSize*(numberOfTasks -1), Math.min(taskSize*numberOfTasks,array.length))));
        

        // Récupérer les résultats et les fusionner
        int s = 0;
        for (int i = 0; i < numberOfTasks; i++) {
            s = s + results.get(i).get();
        }

        return s; // pour que ça compile
    }
    
    public static void main(String[] args) throws Exception {
        String usage = "\nUsage : CountPool <fichier> <nb essais> <taille pool> <nb tâches>\n";
        if (args.length != 4)
          throw new IllegalArgumentException(usage);
            
        String filename = args[0];
        int nbruns = Integer.parseInt (args[1]);
        int poolSize = Integer.parseInt (args[2]);
        int numberOfTasks = Integer.parseInt (args[3]);
        if (nbruns < 5)
          System.out.println("Warning: résultats peu significatifs avec moins de 5 essais.");

        int[] array = LargeIntArray.load(filename);
        if (! LargeIntArray.isSorted(array)) {
            System.err.println("Le tableau doit être trié (java LargeIntArray -s fichier).");
            return;
        }

        Benchmark benchmark = new Benchmark();
        
        ExecutorService executor = Executors.newFixedThreadPool(poolSize);
        benchmark.runExperiments(nbruns, () -> computeCount(executor, array, numberOfTasks));
        executor.shutdown();
    }
}
