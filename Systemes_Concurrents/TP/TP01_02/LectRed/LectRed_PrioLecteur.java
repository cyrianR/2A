// Time-stamp: <11 oct 2024 08:19 Philippe Queinnec>

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux lecteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioLecteur implements LectRed {

    /** Verrou support du moniteur */
    private Lock mon;
    /** Variables conditions du moniteur */
    private Condition canRead;
    private Condition canWrite;

    /** Nombre de rédacteurs en attente */
    private int numWriterWaiting;

    /** Nombre de rédacteurs */
    private int numWriters;

    /** Nombre de lecteurs */
    private int numReaders;

    public LectRed_PrioLecteur() {
        this.mon = new ReentrantLock ();
        this.canRead = mon.newCondition();
        this.canWrite = mon.newCondition();
        this.numWriters = 0;
        this.numReaders = 0;
        this.numWriterWaiting = 0;
    }

    public void demanderLecture() throws InterruptedException {
        mon.lock();
        while (!(numWriters == 0 && numWriterWaiting == 0)) {
            canRead.await();
        }
        numReaders++;
        canRead.signal();
        mon.unlock();
    }

    public void terminerLecture() throws InterruptedException {
        mon.lock();
        numReaders--;
        if (numReaders == 0) {
            canWrite.signal();
        }
        mon.unlock();
    }

    public void demanderEcriture() throws InterruptedException {
        mon.lock();
        while (!(numWriters == 0 && numReaders == 0)) {
            numWriterWaiting++;
            canWrite.await();
            numWriterWaiting--;
        }
        numWriters++;
        mon.unlock();
    }

    public void terminerEcriture() throws InterruptedException {
        mon.lock();
        numWriters--;
        if (numWriterWaiting > 0) {
            canWrite.signal();
        } else {
            canRead.signal();
        } 
        mon.unlock();
    }

    public String nomStrategie() {
        return "Stratégie: Priorité Lecteurs.";
    }
}
