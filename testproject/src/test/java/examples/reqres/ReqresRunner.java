package examples.reqres;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testGorest() {
        return Karate.run("reqres").relativeTo(getClass());
    }    

}
