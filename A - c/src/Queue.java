import java.util.ArrayList;
import java.util.List;

public class Queue<T> implements IQueuable<T>{

    private ArrayList<T> queue = new ArrayList<>(0);

    public Queue() {}

    @Override
    public void enqueue(T value) {
        this.queue.add(0, value);
//        return this.queue;
    }

    @Override
    public void enqueueList(List<T> lst) {
        for (T val : lst){
            this.enqueue(val);
        }
    }

    @Override
    public T dequeue() {
        T val = queue.get(0);
        this.queue.remove(0);
        return val;
    }

    @Override
    public T peak(int index) {
        return this.queue.get(index);
    }

    @Override
    public ArrayList<T> getQueue() {
        return this.queue;
    }

    @Override
    public int size() {
        return queue.size();
    }

    @Override
    public String toString() {
        return this.queue.toString();
    }
}
