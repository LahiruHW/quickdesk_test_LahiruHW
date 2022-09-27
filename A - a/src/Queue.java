import java.util.ArrayList;

public class Queue implements IQueuable{

    private ArrayList<String> queue = new ArrayList<>(0);

    public Queue() {}

    @Override
    public ArrayList<String> enqueue(String value) {
        this.queue.add(0, value);
        return this.queue;
    }

    @Override
    public String dequeue() {
        String val = queue.get(0);
        this.queue.remove(0);
        return val;
    }

    @Override
    public ArrayList<String> getQueue() {
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
