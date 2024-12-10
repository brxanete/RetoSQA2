package examples;

import com.intuit.karate.junit5.Karate;

class exe {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("charmander", "squirtle").relativeTo(getClass());
    }    

}
