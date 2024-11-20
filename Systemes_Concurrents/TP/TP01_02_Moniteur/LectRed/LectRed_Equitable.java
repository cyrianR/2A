import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: équitable,
 * implantation: avec un moniteur. */
public class LectRed_Equitable implements LectRed {

     /** Verrou support du moniteur */
    private Lock mon;
    /** Variables conditions du moniteur */
    private Condition canRead;
    private Condition canWrite;

    /** Nombre de rédacteurs en attente */
    private int numWriterWaiting;
    /** Nombre de lecteurs en attente */
    private int numReaderWaiting;

    /** Nombre de rédacteurs */
    private int numWriters;
    /** Nombre de lecteurs */
    private int numReaders;

    /** Tour rédacteur */
    private boolean isTourReader;

    public LectRed_Equitable() {
        this.mon = new ReentrantLock ();
        this.canRead = mon.newCondition();
        this.canWrite = mon.newCondition();
        this.numWriters = 0;
        this.numReaders = 0;
        this.numWriterWaiting = 0;
        this.numReaderWaiting = 0;
        this.isTourReader = true;
    }

    public void demanderLecture() throws InterruptedException {
        mon.lock();
        while (!(numWriters == 0 && (numWriterWaiting == 0 || isTourReader))) {
            numReaderWaiting++;
            canRead.await();
            numReaderWaiting--;
        }
        numReaders++;
        canRead.signal();
        mon.unlock();
    }

    public void terminerLecture() throws InterruptedException {
        mon.lock();
        isTourReader = false;
        numReaders--;
        if (numReaders == 0) {
            canWrite.signal();
        }
        mon.unlock();
    }

    public void demanderEcriture() throws InterruptedException {
        mon.lock();
        while (!(numWriters == 0 && numReaders == 0) && (numReaderWaiting == 0 || !isTourReader)) {
            numWriterWaiting++;
            canWrite.await();
            numWriterWaiting--;
        }
        numWriters++;
        mon.unlock();
    }

    public void terminerEcriture() throws InterruptedException {
        mon.lock();
        isTourReader = true;
        numWriters--;
        if (numReaderWaiting > 0) {
            canRead.signal();
        } else {
            canWrite.signal();
        }
        mon.unlock();
    }

    public String nomStrategie() {
        return "Stratégie: Equitable.";
    }

}