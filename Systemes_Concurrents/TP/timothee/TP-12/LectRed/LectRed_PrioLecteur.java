// Time-stamp: <11 oct 2024 08:19 Philippe Queinnec>

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux lecteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioLecteur implements LectRed
{
    /** Verrou support du moniteur */
    private Lock mon;
    /** Variables conditions du moniteur */
    private Condition CanRead;
    private Condition CanWrite;

    /* Variables */
    private int NumWriters;
    private int NumReadersWaiting;
    private int NumReaders;

    public LectRed_PrioLecteur() {
        this.mon = new ReentrantLock ();
        this.CanRead = mon.newCondition();
        this.CanWrite = mon.newCondition();
    }

    public void demanderLecture() throws InterruptedException {
        mon.lock();
        while (NumWriters != 0) {
            NumReadersWaiting +=1;
            CanRead.await();
            NumReadersWaiting -=1;
        }
        NumReaders+=1;
        CanRead.signal();
        mon.unlock();
    }

    public void terminerLecture() throws InterruptedException {
        mon.lock();
        NumReaders -=1;
        if (NumReaders == 0){
            CanWrite.signal();
        }
        mon.unlock();
    }

    public void demanderEcriture() throws InterruptedException {
        mon.lock();
        while (NumWriters != 0 || NumReaders != 0 || NumReadersWaiting !=0 ) {
            CanWrite.await();
        }
        NumWriters+=1;
        mon.unlock();
    }

    public void terminerEcriture() throws InterruptedException {
        mon.lock();
        NumWriters -=1;
        if (NumReadersWaiting > 0){
            CanRead.signal();
        }
        else {
            CanWrite.signal();
        }
        mon.unlock();
    }

    public String nomStrategie() {
        return "Stratégie: Priorité Lecteurs.";
    }
}
