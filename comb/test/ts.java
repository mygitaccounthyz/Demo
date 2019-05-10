import com.midpac.data.dao.imp.DaoImp;
import com.midpac.data.dao.imp.UserDaoImp;
import com.midpac.data.service.UserService;
import com.midpac.model.User;
import com.midpac.utils.PageSplit;
import org.junit.Test;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class ts {

    @Test
    public void t1(){

        List list=new ArrayList();
        for (int i = 0; i < 10; i++) {
            list.add(i+1);
        }
        System.out.println("--");
        List page1 =PageSplit.getPage(list, 100, 1);
        for (Object o : page1) {
            System.out.print(o);
        }
        List page2 =PageSplit.getPage(list, 100, 2);
        System.out.println("--");
        for (Object o : page2) {
            System.out.print(o);
        }
        System.out.println("--");
        List page3 = PageSplit.getPage(list, 100, 3);

        for (Object o : page3) {
            System.out.print(o);
        }
        System.out.println("--");
        List page4 =PageSplit.getPage(list, 100, 4);
        for (Object o : page4) {
            System.out.print(o);
        }

    }

    @Test
    public void t2(){
        int [] a ={1,2,3};
        a.toString();
        System.out.println(a);
    }

    @Test
    public void t3(){
        System.out.println(File.separator);
    }

    @Test
    public void t4(){
        System.out.println("a".contains(""));
    }






}
