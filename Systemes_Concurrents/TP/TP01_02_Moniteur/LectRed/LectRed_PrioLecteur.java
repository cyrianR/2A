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

    /** Nombre de lecteurs en attente */
    private int numReaderWaiting;

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
        this.numReaderWaiting = 0;
    }

    public void demanderLecture() throws InterruptedException {
        mon.lock();
        while (!(numWriters == 0)) {
            numReaderWaiting++;
            canRead.await();
            numReaderWaiting--;
        }
        numReaders++;
        mon.unlock();
    }

    public void terminerLecture() throws InterruptedException {
        mon.lock();
        numReaders--;
        if (numReaderWaiting > 0) {
            canRead.signal();
        } else {
            canWrite.signal();
        } 
        mon.unlock();
    }

    public void demanderEcriture() throws InterruptedException {
        mon.lock();
        while (!(numReaders == 0 && numReaderWaiting == 0)) {
            canWrite.await();
        }
        numWriters++;
        //canWrite.signal();
        mon.unlock();
    }

    public void terminerEcriture() throws InterruptedException {
        mon.lock();
        numWriters--;
        canRead.signal();
        mon.unlock();
    }

    public String nomStrategie() {
        return "Stratégie: Priorité Lecteurs.";
    }
}
