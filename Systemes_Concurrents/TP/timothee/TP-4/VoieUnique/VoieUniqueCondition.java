// Time-stamp: <06 jui 2023 11:59 Philippe Queinnec>

import CSP.*;

/** Réalisation de la voie unique avec des canaux JCSP. */
/* Version avec condition d'acceptation */
public class VoieUniqueCondition implements VoieUnique {

    enum ChannelId { EntrerNS, EntrerSN, Sortir };
    
    private Channel<ChannelId> entrerNS;
    private Channel<ChannelId> entrerSN;
    private Channel<ChannelId> sortir;
    
    public VoieUniqueCondition() {
        this.entrerNS = new Channel<>(ChannelId.EntrerNS);
        this.entrerSN = new Channel<>(ChannelId.EntrerSN);
        this.sortir = new Channel<>(ChannelId.Sortir);
        (new Thread(new Scheduler())).start();
    }

    public void entrer(Sens sens) {
        System.out.println("In  entrer " + sens);
        switch (sens) {
          case NS:
            entrerNS.write(true);
            break;
          case SN:
            entrerSN.write(true);
            break;
        }
        System.out.println("Out entrer " + sens);
    }

    public void sortir(Sens sens) {
        System.out.println("In  sortir " + sens);
        sortir.write(true);
        System.out.println("Out sortir " + sens);
    }

    public String nomStrategie () {
        return "Condition";
    }

    /****************************************************************/
    enum Direction {SN, NS};
    class Scheduler implements Runnable {
        private int nbTrains = 0;
        private Direction etat;

        public void run() {
            var geSN = new GuardedChannel<>(entrerSN, (() -> nbTrains == 0 || etat == Direction.SN));
            var geNS = new GuardedChannel<>(entrerNS, (() -> nbTrains == 0 || etat == Direction.NS));
            var gs = new GuardedChannel<>(sortir, Predicate::True);
            var alt = new Alternative<>(geNS, geSN, gs);
            while (true){
                switch (alt.select()) {
                    case EntrerNS:
                      entrerNS.read();
                      nbTrains++;
                      break;
                    case EntrerSN:
                      entrerSN.read();
                      nbTrains++;
                      break;
                    case Sortir:
                      sortir.read();
                      nbTrains--;
                      break;
                  }
            }
        }
    } // class Scheduler
}

