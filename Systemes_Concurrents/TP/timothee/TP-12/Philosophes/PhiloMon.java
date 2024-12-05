import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

/* Squelette d'une solution avec un moniteur.
 * Il manque le moniteur (verrou + variables conditions).
 */
public class PhiloMon implements StrategiePhilo {

    /** Verrou support du moniteur */
    private Lock mon;
    /** Variables conditions du moniteur */
    private Condition[] CanEat;
    // État d'un philosophe : pense, mange, demande ?
    private EtatPhilosophe[] etat;

    /****************************************************************/

    public PhiloMon (int nbPhilosophes) {
        this.etat = new EtatPhilosophe[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            etat[i] = EtatPhilosophe.Pense;
        }
        this.mon = new ReentrantLock ();
        CanEat = new Condition[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            CanEat[i] = mon.newCondition();
        }

    }

    public void demanderFourchettes (int no) throws InterruptedException
    {
        /** || (etat[Main.PhiloDroite(no)]== EtatPhilosophe.Demande && etat[Main.PhiloDroite(Main.PhiloDroite(no))] == EtatPhilosophe.Mange)
                || (etat[Main.PhiloGauche(no)]== EtatPhilosophe.Demande && etat[Main.PhiloGauche(Main.PhiloGauche(no))] == EtatPhilosophe.Mange) */
        mon.lock();
        etat[no] = EtatPhilosophe.Demande;
        while (etat[Main.PhiloDroite(no)]== EtatPhilosophe.Mange
                || etat[Main.PhiloGauche(no)]== EtatPhilosophe.Mange) {
            CanEat[no].await();
        }
        etat[no] = EtatPhilosophe.Mange;
        mon.unlock();
        // j'ai les fourchette G et D
        IHMPhilo.poser (Main.FourchetteGauche(no), EtatFourchette.AssietteDroite);
        IHMPhilo.poser (Main.FourchetteDroite(no), EtatFourchette.AssietteGauche);
        
    }

    public void libererFourchettes (int no)
    {   
        
        IHMPhilo.poser (Main.FourchetteGauche(no), EtatFourchette.Table);
        IHMPhilo.poser (Main.FourchetteDroite(no), EtatFourchette.Table);
        mon.lock();
        etat[no] = EtatPhilosophe.Pense;
        if (etat[Main.PhiloDroite(Main.PhiloDroite(no))] != EtatPhilosophe.Mange) {
            CanEat[Main.PhiloDroite(no)].signal();
        }
        if (etat[Main.PhiloGauche(Main.PhiloGauche(no))] != EtatPhilosophe.Mange) {
            CanEat[Main.PhiloGauche(no)].signal();
        }
        mon.unlock();
    }

    public String nom() {
        return "Moniteur";
    }

}

