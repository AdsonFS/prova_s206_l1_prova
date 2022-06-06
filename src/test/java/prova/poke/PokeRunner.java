package prova.poke;

import com.intuit.karate.junit5.Karate;

public class PokeRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("poke").relativeTo(getClass());
    }
}
