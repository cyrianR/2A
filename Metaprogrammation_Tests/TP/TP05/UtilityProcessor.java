import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import java.util.*;
import javax.tools.Diagnostic.Kind;
import java.lang.reflect.*;
import java.lang.reflect.Modifier;

/** Check that a class marked {@code @Utility} is indeed a utility class. */
@SupportedAnnotationTypes("Utility")
@SupportedSourceVersion(SourceVersion.RELEASE_11)
public class UtilityProcessor extends AbstractProcessor {

	@Override
	public boolean process(
			Set<? extends TypeElement> annotations,
			RoundEnvironment roundingEnvironment)
	{
		Messager messager = processingEnv.getMessager();
		messager.printMessage(Kind.NOTE,
				"UtilityProcessor executed.");
		for (TypeElement te : annotations) {
			for (Element elt : roundingEnvironment.getElementsAnnotatedWith(te)) {
				if (elt.getKind().isClass()) {	// elt is a class
					// Check that the class is declared final
					if (!elt.getModifiers().toString().contains("final")) {
						messager.printMessage(Kind.ERROR,
							"@Utility applies to class with final modifier only:", elt);
					}
					// Check that enclosed elements are static
					if (elt.getEnclosedElements().stream().anyMatch(e -> (e.getKind().isClass() && !Modifier.isStatic(e.getClass().getModifiers())))) {
						messager.printMessage(Kind.ERROR,
							"@Utility applies to class with static enclosed elements:", elt);
					}

				} else {
					messager.printMessage(Kind.ERROR,
							"@Utility applies to class only:", elt);
				}
			}
		}
		return true;
	}

}
