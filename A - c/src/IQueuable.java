import java.util.ArrayList;
import java.util.List;

public interface IQueuable<T> {

    //adds value to queue and returns new queue
    public void enqueue(T value);

    //removes item from queue, and returns the item removed
    public T dequeue();

    //returns a list of all the items in the queue
    public ArrayList<T> getQueue();

    //returns the number of items in the queue
    public int size();

    ///////////////////////////////////////////////////////////////////
    // look at the value at a certain position in the queue
    public T peak(int index);

    // add a whole value of queues into the type of
    public void enqueueList(List<T> lst);

}
