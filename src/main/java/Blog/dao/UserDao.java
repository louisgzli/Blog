package Blog.dao;


import Blog.entity.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.List;
import java.util.Queue;

/**
 * Created by bliss on 2016/6/29.
 */
@Repository
public class UserDao extends BaseDao{
    public User getUserByName(String username){
        String hql= "from User as us where us.username = ?";
        Query query=super.query(hql);
        query.setString(0,username);

        List<User> userlist=query.list();

        return userlist.get(0);

    }
    public void save(User user){
        super.save(user);
    }
}
