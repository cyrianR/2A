import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

/* Squelette d'une solution avec un moniteur.
 * Il manque le moniteur (verrou + variables conditions).
 */
public class PhiloEquitable implements StrategiePhilo {

    /** Verrou support du moniteur */
    private Lock mon;
    /** Variables conditions du moniteur */
    private Condition[] CanEat;
    // État d'un philosophe : pense, mange, demande ?
    private EtatPhilosophe[] etat;
    // Tableau des priorités des fourchettes (1er élément = fourchette à droite du philosophe n°1) : 
    // true => philosophe à gauche à priorité sur la fourchette
    private boolean[] prioF;

    /****************************************************************/

    public PhiloEquitable (int nbPhilosophes) {
        this.etat = new EtatPhilosophe[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            etat[i] = EtatPhilosophe.Pense;
        }
        this.mon = new ReentrantLock ();
        CanEat = new Condition[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            CanEat[i] = mon.newCondition();
        }
        prioF = new boolean[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            prioF[i] = true;
        }

    }

    public void demanderFourchettes (int no) throws InterruptedException
    {
        /** || (etat[Main.PhiloDroite(no)]== EtatPhilosophe.Demande && etat[Main.PhiloDroite(Main.PhiloDroite(no))] == EtatPhilosophe.Mange)
            || (etat[Main.PhiloGauche(no)]== EtatPhilosophe.Demande && etat[Main.PhiloGauche(Main.PhiloGauche(no))] == EtatPhilosophe.Mange) */
        mon.lock();
        etat[no] = EtatPhilosophe.Demande;
        while (etat[Main.PhiloDroite(no)]== EtatPhilosophe.Mange
                || etat[Main.PhiloGauche(no)]== EtatPhilosophe.Mange
                || (etat[Main.PhiloDroite(no)]== EtatPhilosophe.Demande && !prioF[Main.FourchetteDroite(no)])
                || (etat[Main.PhiloGauche(no)]== EtatPhilosophe.Demande && prioF[Main.FourchetteGauche(no)])) {
            CanEat[no].await();
        }
        prioF[Main.FourchetteDroite(no)]=false;
        prioF[Main.FourchetteGauche(no)]=true;
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

