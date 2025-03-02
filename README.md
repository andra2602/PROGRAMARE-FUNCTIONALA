# PROGRAMARE FUNCȚIONALĂ în Haskell

Proiectul de față oferă soluții avansate la diverse probleme de programare funcțională, implementate în Haskell. Realizat în cadrul cursului de Programare Funcțională, acest proiect pune în practică concepte avansate ale limbajului, precum monade, functori, evaluare leneșă și recursivitate complexă, demonstrând puterea și versatilitatea programării funcționale.

## Conținutul Proiectului

### 1. Monade și Evaluare Leneșă
Utilizarea monadei `Maybe`, `IO` și `Reader` pentru a gestiona efectele secundare și a controla calculul expresiilor. Aceste monade permit tratarea erorilor, interacțiunii cu utilizatorul și evaluarea dependentă de context.

### 2. Functori și Applicative
Implementarea și utilizarea funcțiilor de tip `fmap`, `pure` și `(<*>)` pentru a demonstra puterea compoziției funcționale. Aceste concepte sunt fundamentale pentru a manipula și transforma datele într-un mod elegant și robust.

### 3. Evaluarea Expresiilor și Arborii de Evaluare
Definirea unor tipuri personalizate pentru expresii matematice și evaluarea acestora folosind arbori de tip abstract. Se pune accent pe crearea unor reprezentări de date care pot fi evaluate într-un mod eficient și flexibil.

### 4. Probleme de Logică și Evaluare Booleană
Definirea operatorilor logici și evaluarea expresiilor logice într-un mediu controlat (tipul `Prop`). Această secțiune explorează cum putem exprima și evalua probleme logice folosind Haskell.

### 5. Structuri de Date și Clase Personalizate
Implementarea unor structuri de date avansate, cum ar fi arbori de căutare, vectori și colecții personalizate. Acestea sunt realizate prin utilizarea claselor Haskell (de exemplu, `Collection`, `ArbInfo`, și `GeoOps`) pentru a extinde capabilitățile limbajului și a rezolva probleme specifice.

### 6. Transformarea Funcțională a Listelor
Folosirea funcțiilor de ordine superioară precum `map`, `filter`, `foldr` și `foldl` pentru manipularea datelor și optimizarea calculului. Aceste funcții sunt esențiale în programarea funcțională pentru a opera pe colecții de date într-un mod declarativ.

## Concepte Demonstrate

- **Recursivitate Avansată:** Probleme rezolvate prin recursivitate adâncă și optimizată pentru performanță.
- **Paradigma Evaluării Leneșe:** Execuția amânată a calculelor pentru a spori eficiența.
- **Compoziție și Funcții de Ordin Superior:** Utilizarea compunerii funcționale pentru a rezolva probleme în mod elegant și concis.
- **Abstractizare și Reutilizarea Codului:** Folosirea claselor și instanțelor pentru a abstrahiza comportamentele și a reutiliza logica funcțională.
- **Gestionarea Efectelor Secundare:** Controlul efectelor secundare și interacțiunii cu utilizatorul prin monade precum `IO` și `Reader`.

## Scopul Proiectului

- **Evaluare Funcțională Curată:** Implementarea de soluții funcționale fără efecte secundare necontrolate.
- **Manipularea Avansată a Tipurilor:** Crearea și utilizarea de tipuri personalizate pentru rezolvarea diverselor probleme.
- **Modularitate și Abstractizare:** Conceput pentru a demonstra principiile de modularitate și reutilizare a codului în Haskell.

Acest proiect poate servi drept bază de învățare pentru oricine dorește să înțeleagă și să aprofundeze concepte de programare funcțională aplicată în Haskell.
