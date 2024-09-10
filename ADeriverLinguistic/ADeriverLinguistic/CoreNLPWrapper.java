import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;

public class CoreNLPWrapper {
    public static String[] splitPhrases(String input) {
        StanfordCoreNLP pipeline = new StanfordCoreNLP();
        Annotation annotation = new Annotation(input);
        pipeline.annotate(annotation);
        return annotation.getSentences().stream()
                .map(sentence -> sentence.toString())
                .toArray(String[]::new);
    }
}