package idrugs;

import com.intuit.karate.junit5.Karate;

class IdrugsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("idrugs").relativeTo(getClass());
    }    

}
