import java.util.List;

public interface Dao { //data/access/object
    public void create(Person p);
    public List<Person> readAll();
    public void update(Person current, Person candidate);
    public void remove(int id);
    public void removeAll();
    public void makeTransaction();
}
