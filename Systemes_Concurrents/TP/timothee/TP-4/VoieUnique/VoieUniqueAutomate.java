// Time-stamp: <06 jui 2023 11:58 Philippe Queinnec>

import CSP.*;

/** Réalisation de la voie unique avec des canaux JCSP. */
/* Version par automate d'états */
public class VoieUniqueAutomate implements VoieUnique {

    enum ChannelId { EntrerNS, EntrerSN, Sortir };
    
    private Channel<ChannelId> entrerNS;
    private Channel<ChannelId> entrerSN;
    private Channel<ChannelId> sortir;
    
    public VoieUniqueAutomate() {
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

    public String nomStrategie() {
        return "Automate";
    }

    /****************************************************************/
    enum Etat { NS, SN, FREE }
    class Scheduler implements Runnable {
        private Etat etat = Etat.FREE;
        private int nbTrains=0;
        public void run() {
            var altNS = new Alternative<>(entrerNS, sortir);
            var altSN = new Alternative<>(entrerSN, sortir);
            var altEntrer = new Alternative<>(entrerSN, entrerNS);
            while (true) {
                if (etat == Etat.FREE) {
                    switch (altEntrer.select()) {
                        case EntrerSN:
                            entrerSN.read();
                            nbTrains++;
                            etat = Etat.SN;
                            break;
                    
                        case EntrerNS:
                            entrerNS.read();
                            nbTrains++;
                            etat = Etat.NS;
                            break;
                        default:
                            break;
                    }
                } else if (etat == Etat.NS) {
                    switch (altNS.select()) {
                        case EntrerNS:
                            entrerNS.read();
                            nbTrains++;
                            break;
                    
                        case Sortir:
                            sortir.read();
                            nbTrains--;
                            if (nbTrains == 0) { etat = Etat.FREE; }
                            break;
                        default:
                            break;
                    }
                } else {
                    switch (altSN.select()) {
                        case EntrerSN:
                            entrerSN.read();
                            nbTrains++;
                            break;
                    
                        case Sortir:
                            sortir.read();
                            nbTrains--;
                            if (nbTrains == 0) { etat = Etat.FREE; }
                            break;
                        default:
                            break;
                    }
                }
            }
            
        }
        
    } // class Scheduler
}

