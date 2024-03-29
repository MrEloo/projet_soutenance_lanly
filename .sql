-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 28 mars 2024 à 23:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eloancoindin_lanly`
--

-- --------------------------------------------------------

--
-- Structure de la table `contries_de`
--

CREATE TABLE `contries_de` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(255) NOT NULL,
  `language_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_de`
--

INSERT INTO `contries_de` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'Frankreich', 0, 1),
(2, 'Deutschland', 0, 2),
(3, 'Italien', 0, 3),
(4, 'Spanien', 0, 4),
(5, 'Russland', 0, 5),
(6, 'England', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contries_en`
--

CREATE TABLE `contries_en` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(255) NOT NULL,
  `language_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_en`
--

INSERT INTO `contries_en` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'France', 0, 1),
(2, 'Germany', 0, 2),
(3, 'Italy', 0, 3),
(4, 'Spain', 0, 4),
(5, 'Russia', 0, 5),
(6, 'England', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contries_es`
--

CREATE TABLE `contries_es` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(255) NOT NULL,
  `language_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_es`
--

INSERT INTO `contries_es` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'Francia', 0, 1),
(2, 'Alemania', 0, 2),
(3, 'Italia', 0, 3),
(4, 'España', 0, 4),
(5, 'Rusia', 0, 5),
(6, 'Inglaterra', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contries_fr`
--

CREATE TABLE `contries_fr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_fr`
--

INSERT INTO `contries_fr` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'france', 66000000, 1),
(2, 'Allemagne', 54000000, 2),
(3, 'italie', 60000000, 3),
(4, 'espagne', 47000000, 4),
(5, 'russie', 143000000, 5),
(6, 'angleterre', 67000000, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contries_it`
--

CREATE TABLE `contries_it` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(255) NOT NULL,
  `language_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_it`
--

INSERT INTO `contries_it` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'Francia', 0, 1),
(2, 'Germania', 0, 2),
(3, 'Italia', 0, 3),
(4, 'Spagna', 0, 4),
(5, 'Russia', 0, 5),
(6, 'Inghilterra', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `contries_ru`
--

CREATE TABLE `contries_ru` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nb_people` int(255) NOT NULL,
  `language_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contries_ru`
--

INSERT INTO `contries_ru` (`id`, `name`, `nb_people`, `language_id`) VALUES
(1, 'Франция', 0, 1),
(2, 'Германия', 0, 2),
(3, 'Италия', 0, 3),
(4, 'Испания', 0, 4),
(5, 'Россия', 0, 5),
(6, 'Англия', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_de`
--

CREATE TABLE `courses_de` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_de`
--

INSERT INTO `courses_de` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'Der bestimmte und unbestimmte Artikel im Akkusativ', 'Wie im Französischen findet man das direkte Objekt im Deutschen, indem man die Fragen \'wen?\' oder \'was?\' stellt. Wenn die Nominalgruppe die Funktion des direkten Objekts im Satz hat, muss sie im Akkusativ stehen. Der Artikel nimmt dann die Form des Akkusativs an.\r\n\r\nDeshalb haben wir:\r\n\r\nMaskulin:\r\n\r\nBestimmter Artikel: den\r\nUnbestimmter Artikel: einen\r\n\r\nFeminin:\r\n\r\nBestimmter Artikel: die\r\nUnbestimmter Artikel: eine\r\n\r\nNeutral:\r\n\r\nBestimmter Artikel: das\r\nUnbestimmter Artikel: ein\r\n\r\nPlural:\r\n\r\nBestimmter Artikel: die\r\nUnbestimmter Artikel: keine', 1, 2),
(2, 'Die Begrüßungen', 'Hallo : Hallo\r\n\r\nGuten Morgen : Guten Morgen\r\n\r\nGuten Tag\r\n\r\nGuten Abend\r\n\r\nAuf Wiedersehen\r\n\r\nTschüss', 2, 2),
(3, 'Die Zahlen', 'Eins\r\nZwei\r\nDrei\r\nVier\r\nFünf\r\nSechs\r\nSieben\r\nAcht\r\nNeun\r\nZehn', 2, 2),
(4, 'Die Wochentage', 'Montag\r\nDienstag\r\nMittwoch\r\nDonnerstag\r\nFreitag\r\nSamstag\r\nSonntag', 2, 2),
(5, 'Die Monate des Jahres', 'Januar : Janvier\r\nFebruar : Février\r\nMärz\r\nApril\r\nMai\r\nJuni\r\nJuli\r\nAugust\r\nSeptember\r\nOktober\r\nNovember\r\nDezember', 2, 2),
(6, 'Die Familienmitglieder', 'Mutter\r\nVater\r\nBruder\r\nSchwester\r\nGroßmutter\r\nGroßvater\r\nSohn\r\nTochter\r\nOnkel\r\nTante', 2, 2),
(7, 'Die Pluralformen der Nomen', 'Im Deutschen verwenden wir in der Regel die folgenden Regeln, um den Plural von Nomen zu bilden:\r\n\r\nFüge \"-e\" am Ende des Wortes hinzu: Beispiel: \"der Tisch\" wird zu \"die Tische\".\r\nFüge \"-n\" am Ende des Wortes hinzu: Beispiel: \"das Buch\" wird zu \"die Bücher\".\r\nFüge \"-en\" am Ende des Wortes hinzu: Beispiel: \"der Stuhl\" wird zu \"die Stühle\".\r\nEinige Wörter haben unregelmäßige Pluralformen: Beispiel: \"der Mann\" wird zu \"die Männer.', 3, 2),
(8, 'Die Großbuchstaben', 'Großbuchstaben: Wie im Französischen ist der erste Buchstabe eines Satzes, eines Eigennamens oder eines Titels im Deutschen immer großgeschrieben.', 3, 2),
(9, 'Die regelmäßigen Verben', 'auch als \"schwache Verben\" bezeichnet, sind Verben, die den Standardkonjugationsregeln folgen.\nHier ist eine Liste der häufigsten schwachen Verben:\n\narbeiten\nbauen\nbedienen\nbegleiten\nbetrachten\nbewegen\nbesichtigen\nbrauchen\nentdecken\n(sich) erinnern', 1, 6),
(10, 'Die unregelmäßigen Verben', 'Die unregelmäßigen Verben, auch als \"starke Verben\" bekannt, folgen nicht den gleichen Regeln und passen nicht in einen bestimmten Satz von Regeln oder Formeln.\nHier ist eine Liste der häufigsten starken Verben:\n\nhalten\nschlafen\nfahren\ngeben\nessen\nnehmen\nbeginnen\nfinden\nbleiben\nbieten', 1, 6),
(11, 'Der unbestimmte Artikel \"A/An', 'Entspricht \"ein/eine\" im Deutschen.\r\n\r\nWird vor einem Singularnoun verwendet, um eine Sache im Allgemeinen zu bezeichnen.', 1, 6),
(12, 'Der bestimmte Artikel \"The\" / Der Nullartikel', 'Der bestimmte Artikel \"The\" entspricht im Deutschen \"der/die/das\". Er wird vor einem Singular- oder Pluralnomen verwendet, um etwas spezifisch zu bezeichnen. Er wird \"/i/\" ausgesprochen, bevor ein Vokalton erscheint. Es gibt keine spezifische Aussprache vor dem Ton \"/j/\".\r\n\r\nDer Nullartikel entspricht der fehlenden Artikelpräsenz. Er wird in folgenden Fällen verwendet:\r\na) Vor abstrakten Nomen oder Nomen, die allgemeine Dinge repräsentieren.\r\nb) In Präferenzen oder Meinungen.\r\nc) In bestimmten syntaktischen Konstruktionen (Tage, Monate, Eigennamen, Funktionen)', 1, 6),
(13, 'Majuskeln', 'Im Englischen werden Großbuchstaben (auch als capital letter, block letter oder uppercase letter bezeichnet) hauptsächlich verwendet:\r\n\r\nAm Anfang eines Satzes: Die Regel im Englischen ist die gleiche wie im Französischen: Egal, ob Ihr Satz affirmativ, negativ, interrogativ oder imperativ ist, er muss mit einem Großbuchstaben beginnen.\r\n\r\nFür Vornamen, Nachnamen und Spitznamen: Alle Vornamen, Nachnamen und anderen Spitznamen müssen mit einem Großbuchstaben beginnen. Diese Regel gilt auch für Kosenamen, die einem bestimmten Familienmitglied ohne Artikel gegeben werden.\r\n\r\nFür die Namen von Tagen und Monaten: Im Gegensatz zu einer verbreiteten Vorstellung werden die Namen von Tagen und Monaten im Deutschen nicht großgeschrieben. Im Englischen hingegen beginnen sie immer mit einem Großbuchstaben: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday und Sunday, sowie January, February, March, April, May, June, July, August, September, October, November und December.\r\n\r\nFür jedes wichtige Wort im Titel eines Werkes: Im Französischen müssen Sie einen Großbuchstaben am Anfang und am Anfang jedes wichtigen Wortes im Titel eines Films, Buchs oder anderen künstlerischen Werks verwenden, das kein bestimmter Artikel (le, la, les, un, du usw.) ist. Im Englischen ist die Regel dieselbe, aber zusätzlich müssen Sie jedem anderen wichtigen Wort im Titel einen Großbuchstaben geben.\r\n\r\nFür Eigennamen geographischer Orte, Nationalitäten und Sprachen: Im Englischen beginnen geographische Eigennamen immer mit einem Großbuchstaben. Diese Regel gilt für jedes Element desselben Namens.', 3, 6),
(14, 'Tage der Woche', 'Die 7 Tage der Woche auf Englisch sind:\r\n\r\nMonday (Montag)\r\n\r\nTuesday (Dienstag)\r\n\r\nWednesday (Mittwoch)\r\n\r\nThursday (Donnerstag)\r\n\r\nFriday (Freitag)\r\n\r\nSaturday (Samstag)\r\n\r\nSunday (Sonntag)\r\n\r\nSie werden feststellen:\r\n\r\nSie alle beginnen mit einem Großbuchstaben (das sollte man nicht vergessen!), im Gegensatz zum Französischen.\r\nSie enden alle mit \"day\", was \"Tag\" bedeutet.\r\n\r\n\r\n\r\n\r\n', 2, 6),
(15, 'Wissen zu zählen', 'Die einfachsten, von 1 bis 10:\r\n1 one, 2 two, 3 three, 4 four, 5 five, 6 six, 7 seven, 8 eight, 9 nine, 10 ten.\r\n\r\nVon 10 bis 100 ist es wichtig, sich diejenigen zu merken, die mit Null enden:\r\n10 ten, 20 twenty, 30 thirty, 40 forty, 50 fifty, 60 sixty, 70 seventy, 80 eighty, 90 ninety, 100 hundred.\r\n\r\n2.1. Von 10 bis 20, das lernt man auch auswendig:\r\n\r\n11 eleven, 12 twelve, 13 thirteen, 14 fourteen, 15 fifteen, 16 sixteen, 17 seventeen, 18 eighteen, 19 nineteen.\r\n\r\n2.2. Für andere zusammengesetzte Zahlen fügen wir die Zahlen, die mit Null enden, hinzu + eine Ziffer von 1 bis 10:\r\n\r\ntwenty-one, thirty-two, forty-three, fifty-four, usw.', 2, 6),
(16, 'Die Gegenwart: Die bejahende Form', 'Die bejahende Form der einfachen Gegenwart wird gebildet: Subjekt + Verbstamm + Ergänzung. Der Verbstamm entspricht dem Infinitiv, ohne das Partikel \"to\".\r\n\r\nMan muss daran denken, ein -s oder -es zur dritten Person Singular hinzuzufügen, wenn das Verb auf -o, -s, -x oder -ch endet.', 4, 6),
(17, 'Die Gegenwart: Die negative Form', 'Die negative Form der einfachen Gegenwart wird gebildet: Subjekt + do / does + not + Verbstamm + Ergänzung. Do not und does not können zu don’t und doesn’t verkürzt werden.\r\n\r\nEs ist das Hilfsverb does und nicht das Hauptverb, das die Kennzeichnung für die dritte Person trägt.', 4, 6),
(18, 'Die Gegenwart: Die interrogative Form', 'Um eine Frage in der einfachen Gegenwart zu bilden, muss das Subjekt und das Hilfsverb do / does umgekehrt werden: do / does + Subjekt + Verbstamm + Ergänzung.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_en`
--

CREATE TABLE `courses_en` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_en`
--

INSERT INTO `courses_en` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'The definite and indefinite articles in the accusative case.', 'The definite and indefinite articles in the accusative case, as in French, the German direct object is identified by asking \'whom?\' or \'what?\'. When the noun functions as the direct object in the sentence, it must be in the accusative case. It is the determiner that takes the accusative marker.\r\n\r\nThus, we have: Masculine:\r\n\r\nDefinite article: den\r\nIndefinite article: einen\r\nFeminine:\r\n\r\nDefinite article: die\r\nIndefinite article: eine\r\nNeuter:\r\n\r\nDefinite article: das\r\nIndefinite article: ein\r\nPlural:\r\n\r\nDefinite article: die\r\nIndefinite article: keine', 1, 2),
(2, 'Greetings', 'Hallo: Hello\r\nGuten Morgen: Good morning\r\nGuten Tag: Good afternoon\r\nGuten Abend: Good evening\r\nAuf Wiedersehen: Goodbye\r\nTschüss: Bye (informal)', 2, 2),
(3, 'The numbers', 'Eins: One\r\nZwei: Two\r\nDrei: Three\r\nVier: Four\r\nFünf: Five\r\nSechs: Six\r\nSieben: Seven\r\nAcht: Eight\r\nNeun: Nine\r\nZehn: Ten', 2, 2),
(4, 'The days of the week', 'Montag: Monday\r\nDienstag: Tuesday\r\nMittwoch: Wednesday\r\nDonnerstag: Thursday\r\nFreitag: Friday\r\nSamstag: Saturday\r\nSonntag: Sunday', 2, 2),
(5, 'The months of the year', 'Januar: January\r\nFebruar: February\r\nMärz: March\r\nApril: April\r\nMai: May\r\nJuni: June\r\nJuli: July\r\nAugust: August\r\nSeptember: September\r\nOktober: October\r\nNovember: November\r\nDezember: December', 2, 2),
(6, 'The family members', 'Mutter: Mother\r\nVater: Father\r\nBruder: Brother\r\nSchwester: Sister\r\nGroßmutter: Grandmother\r\nGroßvater: Grandfather\r\nSohn: Son\r\nTochter: Daughter\r\nOnkel: Uncle\r\nTante: Aunt', 2, 2),
(7, 'Plurals of nouns', 'In German, to form the plural of nouns, the following rules are generally used:\r\n\r\nAdd \"-e\" to the end of the word: Example: \"der Tisch\" (the table) becomes \"die Tische\" (the tables).\r\nAdd \"-n\" to the end of the word: Example: \"das Buch\" (the book) becomes \"die Bücher\" (the books).\r\nAdd \"-en\" to the end of the word: Example: \"der Stuhl\" (the chair) becomes \"die Stühle\" (the chairs).\r\nSome words have irregular plurals: Example: \"der Mann\" (the man) becomes \"die Männer\" (the men)', 3, 2),
(8, 'Capital letters', 'Capital letter: Just like in French, the first letter of a sentence, a proper noun, or a title is always capitalized in German.', 3, 2),
(9, 'Regular verbs', 'Regular verbs, also called \'weak\' verbs, are verbs that follow standard conjugation rules.\r\nHere is a list of the most common weak verbs:\r\n\r\narbeiten → to work\r\nbauen → to build\r\nbedienen → to serve (oneself)\r\nbegleiten → to accompany\r\nbetrachten → to consider\r\nbewegen → to move\r\nbesichtigen → to visit\r\nbrauchen → to need\r\nentdecken → to discover\r\n(sich) erinnern → to remember', 4, 2),
(10, 'Irregular verbs', 'Irregular verbs, also known as \'strong\' verbs, do not follow the same rules and do not fit into a specific set of rules or formulas.\r\nHere is a list of the most common strong verbs:\r\n\r\nhalten → to hold\r\nschlafen → to sleep\r\nfahren → to drive/go (vehicle)\r\ngeben → to give\r\nessen → to eat\r\nnehmen → to take\r\nbeginnen → to begin\r\nfinden → to find\r\nbleiben → to stay\r\nbieten → to offer', 4, 2),
(11, 'The indefinite article', 'It is used before a singular noun to refer to something in a general sense.', 1, 6),
(12, 'The definite article \'The\' / Zero article', 'Used before a singular or plural noun to refer to something in a specific manner. Pronounced as \'/ði/\' before a vowel sound. No specific pronunciation before the sound \'/j/\'.\r\n\r\nThe zero article corresponds to the absence of an article. Used in the following cases:\r\na) Before abstract nouns or representing things in general.\r\nb) In preferences or opinions.\r\nc) In certain syntactic structures (days, months, proper nouns, functions).', 1, 6),
(13, 'Capital Letters', 'In English, a capital letter (referred to as a capital letter, block letter, or uppercase letter) is primarily used:\r\n\r\nAt the beginning of a sentence\r\nThe English rule is the same as in French: regardless of whether your sentence is affirmative, negative, interrogative, or imperative, you must begin it with a capital letter.\r\n\r\nFor first names, last names, and nicknames\r\nAll first names, last names, and other nicknames should begin with a capital letter. This rule also applies to affectionate names given to a specific family member, without a determiner.\r\n\r\nFor the names of days and months\r\nContrary to popular belief, the names of days and months are written with capital letters in English. However, this is the opposite in French: you always start with a capital letter for Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday, and for January, February, March, April, May, June, July, August, September, October, November, and December.\r\n\r\nFor each important word in the title of a work\r\nIn French, when writing the title of a film, book, or other artistic work, a capital letter must be placed at the beginning and on the first important word, i.e., any word that is not \"le\", \"la\", \"les\", \"un\", \"du\", etc. In English, the rule is the same, but you must also capitalize all other important words in the title.\r\n\r\nFor proper place names, nationalities, and languages\r\nIn English, geographical proper nouns begin with a capital letter. This rule applies to each element of the same name.', 3, 6),
(14, 'The 7 days of the week', 'Monday\r\nTuesday\r\nWednesday\r\nThursday \r\nFriday\r\nSaturday\r\nSunday', 2, 6),
(15, 'Numbers', '1: one\r\n2: two\r\n3: three\r\n4: four\r\n5: five\r\n6: six\r\n7: seven\r\n8: eight\r\n9: nine\r\n10: ten\r\n11: eleven\r\n12: twelve\r\n13: thirteen\r\n14: fourteen\r\n15: fifteen\r\n16: sixteen\r\n17: seventeen\r\n18: eighteen\r\n19: nineteen\r\n20: twenty\r\n10: ten\r\n20: twenty\r\n30: thirty\r\n40: forty\r\n50: fifty\r\n60: sixty\r\n70: seventy\r\n80: eighty\r\n90: ninety\r\n100: hundred', 2, 6),
(16, 'The present: The affirmative form', 'The affirmative form of the present simple is formed by: subject + base verb + complement. The base verb corresponds to the infinitive, without the \'to\' particle.\r\n\r\nIt\'s necessary to add an -s or -es to the third person singular when the verb ends in -o, -s, -x, -ch.', 4, 6),
(17, 'The present: The negative form', 'The negative form of the present simple is formed by: subject + do / does + not + base verb + complement. Do not and does not can be contracted into don’t and doesn’t.\r\n\r\nIt\'s the auxiliary does and not the main verb that then carries the third person marker.', 4, 6),
(18, 'The present: The interrogative form', 'To form a question in the present simple, it is necessary to invert the subject and the auxiliary do: do / does + subject + base verb + complement.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_es`
--

CREATE TABLE `courses_es` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_es`
--

INSERT INTO `courses_es` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'cs', 'cs', 1, 1),
(2, 'Saludos', 'Hallo: Hola\r\nGuten Morgen: Buenos días\r\nGuten Tag: Buenas tardes\r\nGuten Abend: Buenas noches\r\nAuf Wiedersehen: Adiós\r\nTschüss: Chao (informal)', 2, 2),
(3, 'Los números', 'Eins: Uno\r\nZwei: Dos\r\nDrei: Tres\r\nVier: Cuatro\r\nFünf: Cinco\r\nSechs: Seis\r\nSieben: Siete\r\nAcht: Ocho\r\nNeun: Nueve\r\nZehn: Diez', 2, 2),
(4, 'Los días de la semana', 'Montag: Lunes\r\nDienstag: Martes\r\nMittwoch: Miércoles\r\nDonnerstag: Jueves\r\nFreitag: Viernes\r\nSamstag: Sábado\r\nSonntag: Domingo', 2, 2),
(5, 'Los meses del año', 'Januar: Enero\r\nFebruar: Febrero\r\nMärz: Marzo\r\nApril: Abril\r\nMai: Mayo\r\nJuni: Junio\r\nJuli: Julio\r\nAugust: Agosto\r\nSeptember: Septiembre\r\nOktober: Octubre\r\nNovember: Noviembre\r\nDezember: Diciembre', 2, 2),
(6, 'Los miembros de la familia', 'Mutter: Madre\r\nVater: Padre\r\nBruder: Hermano\r\nSchwester: Hermana\r\nGroßmutter: Abuela\r\nGroßvater: Abuelo\r\nSohn: Hijo\r\nTochter: Hija\r\nOnkel: Tío\r\nTante: Tía', 2, 2),
(7, 'Plurales de los nombres', 'En alemán, para formar el plural de los nombres, generalmente se utilizan las siguientes reglas:\r\n\r\nAgregar \"-e\" al final de la palabra: Ejemplo: \"der Tisch\" (la mesa) se convierte en \"die Tische\" (las mesas).\r\nAgregar \"-n\" al final de la palabra: Ejemplo: \"das Buch\" (el libro) se convierte en \"die Bücher\" (los libros).\r\nAgregar \"-en\" al final de la palabra: Ejemplo: \"der Stuhl\" (la silla) se convierte en \"die Stühle\" (las sillas).\r\nAlgunas palabras tienen plurales irregulares: Ejemplo: \"der Mann\" (el hombre) se convierte en \"die Männer\" (los hombres).', 3, 2),
(8, 'Mayúsculas', 'Mayúscula: Al igual que en francés, la primera letra de una oración, un nombre propio o un título siempre va en mayúscula en alemán.', 3, 2),
(9, 'Verbos regulares', 'Los verbos regulares, también llamados verbos \'débiles\', son verbos que siguen reglas de conjugación estándar.\r\nAquí tienes una lista de los verbos débiles más comunes:\r\n\r\narbeiten → trabajar\r\nbauen → construir\r\nbedienen → (servirse)\r\nbegleiten → acompañar\r\nbetrachten → considerar\r\nbewegen → mover\r\nbesichtigen → visitar\r\nbrauchen → necesitar\r\nentdecken → descubrir\r\n(sich) erinnern → recordar', 4, 2),
(10, 'Verbos irregulares', 'Los verbos irregulares, también conocidos como \'fuertes\', no siguen las mismas reglas y no se ajustan a un conjunto específico de reglas o fórmulas.\r\nAquí tienes una lista de los verbos fuertes más comunes:\r\n\r\nhalten → sostener\r\nschlafen → dormir\r\nfahren → conducir/ir (vehículo)\r\ngeben → dar\r\nessen → comer\r\nnehmen → tomar\r\nbeginnen → comenzar\r\nfinden → encontrar\r\nbleiben → quedarse\r\nbieten → ofrecer', 4, 2),
(11, 'El artículo indefinido', 'A/An corresponde a \"uno/una\" en español.\nSe utiliza antes de un sustantivo singular para referirse a algo en sentido general.It is used before a singular noun to refer to something in a general sense.', 1, 6),
(12, 'El artículo definido \'The\' / Artículo cero', 'El artículo definido \'The\' corresponde a \'el\' o \'la\' en español. Se utiliza antes de un sustantivo singular o plural para referirse a algo de manera específica. Se pronuncia como \'/ði/\' antes de un sonido vocálico. No hay una pronunciación específica antes del sonido \'/j/\'.\r\n\r\nEl artículo cero corresponde a la ausencia de artículo. Se utiliza en los siguientes casos:\r\na) Antes de sustantivos abstractos o que representan cosas en general.\r\nb) En preferencias u opiniones.\r\nc) En ciertas estructuras sintácticas (días, meses, nombres propios, funciones).', 1, 6),
(13, 'El uso de mayúsculas', 'En inglés, las letras mayúsculas (también llamadas capital letters, block letters o uppercase letters) se utilizan principalmente de la siguiente manera:\r\n\r\nAl principio de una oración\r\nLa regla en inglés es la misma que en francés: sin importar si tu oración es afirmativa, negativa, interrogativa o imperativa, debes comenzarla con una letra mayúscula.\r\n\r\nPara nombres propios, apellidos y apodos\r\nTodos los nombres propios, apellidos y otros apodos deben comenzar con una letra mayúscula. Esta regla también se aplica a los nombres afectivos dados a un miembro específico de la familia, sin un determinante.\r\n\r\nPara los nombres de días y meses\r\nContrariamente a una creencia común, los nombres de días y meses se escriben con letras mayúsculas en inglés. Sin embargo, es lo contrario en francés: siempre se comienza con una letra mayúscula para Monday, Tuesday, Wednesday, Thursday, Friday, Saturday y Sunday, y para January, February, March, April, May, June, July, August, September, October, November y December.\r\n\r\nPara cada palabra importante en el título de una obra\r\nAl escribir el título de una película, libro u otra obra artística, se debe colocar una letra mayúscula al principio y en la primera palabra importante, es decir, cualquier palabra que no sea \"le\", \"la\", \"les\", \"un\", \"du\", etc. En inglés, la regla es la misma, pero también debes poner en mayúscula todas las demás palabras importantes del título.\r\n\r\nPara nombres de lugares, nacionalidades e idiomas\r\nEn inglés, los nombres propios geográficos comienzan con una letra mayúscula. Esta regla se aplica a cada elemento del mismo nombre.', 3, 6),
(14, ' Los 7 días de la semana', 'Monday (lunes)\r\nTuesday (martes)\r\nWednesday (miércoles)\r\nThursday (jueves)\r\nFriday (viernes)\r\nSaturday (sábado)\r\nSunday (domingo)\r\n\r\nObservarás:\r\n\r\nQue todos comienzan con una letra mayúscula (¡no olvides eso!), a diferencia del francés.\r\nQue todos terminan con \"day\", que significa \"día\".', 2, 6),
(15, 'número', '1: uno\r\n2: dos\r\n3: tres\r\n4: cuatro\r\n5: cinco\r\n6: seis\r\n7: siete\r\n8: ocho\r\n9: nueve\r\n\r\n10: diez\r\n20: veinte\r\n30: treinta\r\n40: cuarenta\r\n50: cincuenta\r\n60: sesenta\r\n70: setenta\r\n80: ochenta\r\n90: noventa\r\n100: cien\r\n11: once\r\n12: doce\r\n13: trece\r\n14: catorce\r\n15: quince\r\n16: dieciséis\r\n17: diecisiete\r\n18: dieciocho\r\n19: diecinueve\r\n20: veinte\r\n', 2, 6),
(16, 'El presente: La forma afirmativa', 'La forma afirmativa del presente simple se forma por: sujeto + verbo base + complemento. El verbo base corresponde al infinitivo, sin la partícula \'to\'.\r\n\r\nEs necesario agregar una -s o -es a la tercera persona del singular cuando el verbo termina en -o, -s, -x, -ch.', 4, 6),
(17, 'El presente: La forma negativa', 'La forma negativa del presente simple se forma así: sujeto + do / does + not + verbo base + complemento. Do not y does not pueden contraerse en don’t y doesn’t.\r\n\r\nEs el auxiliar does y no el verbo principal el que lleva la marca de la tercera persona.', 4, 6),
(18, 'El presente: La forma interrogativa', 'Para formar una pregunta en el presente simple, es necesario invertir el sujeto y el auxiliar do: do / does + sujeto + verbo base + complemento.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_fr`
--

CREATE TABLE `courses_fr` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_fr`
--

INSERT INTO `courses_fr` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'l\'article défini et indéfini en accusatif', 'Al igual que en espanol, encontramos el Complemento Directo (CD) en alemán al preguntar \'¿quién?\', \'¿qué?\' = \'wen?\'. Cuando el grupo nominal tiene la función de CD en la oración, debe estar en acusativo. Es el determinante que llevará la marca del acusativo.\n\nAsí, tenemos:\nMasculino:\n\nArtículo definido: den\nArtículo indefinido: einen\nFemenino:\n\nArtículo definido: die\nArtículo indefinido: eine\nNeutro:\n\nArtículo definido: das\nArtículo indefinido: ein\nPlural:\n\nArtículo definido: die\nArtículo indefinido: keine\nAinsi, nous avons: 	\nMasculin :\n\nArticle défini : den\nArticle indéfini : einen\nFéminin :\n\nArticle défini : die\nArticle indéfini : eine\nNeutre :\n\nArticle défini : das\nArticle indéfini : ein\nPluriel :\n\nArticle défini : die\nArticle indéfini : keine', 1, 2),
(2, 'Les salutations', 'Hallo : Bonjour\nGuten Morgen : Bonjour (le matin)\nGuten Tag : Bonjour (l\'après-midi)\nGuten Abend : Bonsoir\nAuf Wiedersehen : Au revoir\nTschüss : Salut (informel)', 2, 2),
(3, 'Les nombres', 'Eins : Un\nZwei : Deux\nDrei : Trois\nVier : Quatre\nFünf : Cinq\nSechs : Six\nSieben : Sept\nAcht : Huit\nNeun : Neuf\nZehn : Dix', 2, 2),
(4, 'Les jours de la semaine', 'Montag : Lundi\nDienstag : Mardi\nMittwoch : Mercredi\nDonnerstag : Jeudi\nFreitag : Vendredi\nSamstag : Samedi\nSonntag : Dimanche', 2, 2),
(5, 'Les mois de l\'année :', 'Januar : Janvier\nFebruar : Février\nMärz : Mars\nApril : Avril\nMai : Mai\nJuni : Juin\nJuli : Juillet\nAugust : Août\nSeptember : Septembre\nOktober : Octobre\nNovember : Novembre\nDezember : Décembre', 2, 2),
(6, 'Les membres de la famille :', 'Mutter : Mère\nVater : Père\nBruder : Frère\nSchwester : Soeur\nGroßmutter : Grand-mère\nGroßvater : Grand-père\nSohn : Fils\nTochter : Fille\nOnkel : Oncle\nTante : Tante', 2, 2),
(7, 'Les pluriels des noms', 'En allemand, pour former le pluriel des noms, on utilise généralement les règles suivantes :\n\nAjouter \"-e\" à la fin du mot : Exemple : \"der Tisch\" (la table) devient \"die Tische\" (les tables).\nAjouter \"-n\" à la fin du mot : Exemple : \"das Buch\" (le livre) devient \"die Bücher\" (les livres).\nAjouter \"-en\" à la fin du mot : Exemple : \"der Stuhl\" (la chaise) devient \"die Stühle\" (les chaises).\nCertains mots ont des pluriels irréguliers : Exemple : \"der Mann\" (l\'homme) devient \"die Männer\" (les hommes).', 3, 2),
(8, 'Les majuscules', 'La majuscule : Comme en français, la première lettre d\'une phrase, d\'un nom propre ou d\'un titre est toujours en majuscule en allemand.', 3, 2),
(9, 'Les verbes réguliers', ' Les verbes réguliers, également appelés verbes « faibles », sont les verbes qui obéissent à des règles de conjugaison standard. \nVoici une liste des verbes faibles les plus courants :\n\narbeiten → travailler\nbauen → construire\nbedienen → (se) servir\nbegleiten → accompagner\nbetrachten → considérer\nbewegen → bouger\nbesichtigen → visiter\nbrauchen → avoir besoin\nentdecken → découvrir\n(sich) erinnern → (se) rappeler', 4, 2),
(10, 'Les verbes irréguliers', 'Les verbes irréguliers, également connus sous le nom de verbes « forts », ne suivent pas les mêmes règles et ne s’inscrivent pas dans un ensemble spécifique de règles ou de formules.  \nVoici une liste des verbes forts les plus courants :\n\nhalten → tenir\nschlafen → dormir\nfahren → aller (véhicule)\ngeben → donner\nessen → manger\nnehmen → prendre\nbeginnen → commencer\nfinden → trouver\nbleiben → rester\nbieten → offrir', 4, 2),
(11, 'L\'article indéfini \"A/An\"', 'Correspond à \"un/une\" en français.\nUtilisé devant un nom singulier pour désigner une chose de manière générale.', 1, 6),
(12, 'L\'article défini \"The\" / L\'article zéro', 'L\'article défini \"The\" correspond à \"le/la\" en français. \nUtilisé devant un nom singulier ou pluriel pour désigner quelque chose de manière spécifique.\nPrononcé \"/i/\" avant un son voyelle.\nPas de prononciation spécifique avant le son /j/.\n\nL\'article zéro correspond à l\'absence d\'article.\nUtilisé dans les cas suivants :\na) Devant des noms abstraits ou représentant des choses en général.\nb) Dans les préférences ou opinions.\nc) Dans certaines tournures syntaxiques (jours, mois, noms propres, fonctions).', 1, 6),
(13, 'Les majuscules', 'En anglais, la lettre majuscule (appelée capital letter, block letter ou encore uppercase letter) s’utilise principalement :\n\ndans le premier mot d’une phrase\n\nLa règle anglaise est la même que la française : que votre phrase soit affirmative, négative, interrogative ou impérative, vous devez la commencer par une majuscule.\n\npour les prénoms, noms et surnoms\n\nTous les prénoms, noms de famille et autres surnoms doivent commencer par une majuscule. Cette règle vaut également pour les noms affectifs donnés à un membre précis de sa famille, sans déterminant.\n\npour les noms des jours et des mois\n\nContrairement à une idée répandue, les noms de jours et de mois s’écrivent sans majuscules en français. En revanche, c’est tout le contraire en anglais : on commence toujours par une majuscule pour Monday, Tuesday, Wednesday, Thursday, Friday, Saturday et Sunday, et pour January, February, March, April, May, June, July, August, September, October, November et December.\n\npour chaque mot important du titre d’une d’œuvre\n\nEn français, pour écrire le titre d’un film, d’un livre ou d’une autre œuvre artistique, on doit mettre une majuscule au début puis sur le premier mot d’importance, c’est-à-dire tout mot qui n’est pas “le”, “la”, “les”, “un”, “du”, etc. En anglais, la règle est la même, mais il faut en plus mettre une majuscule à tous les autres mots importants du titre.\n\npour les noms de lieux propres, de nationalités et de langues\n\nEn anglais, les noms propres géographiques commencent par une majuscule. Cette règle vaut pour chaque élément du même nom :\n', 3, 6),
(14, 'Jours de la semaine', 'Les 7 jours de la semaine en anglais sont :\n\n\n- Monday (lundi)\n\n- Tuesday (mardi)\n\n- Wednesday (mercredi)\n\n- Thursday (jeudi)\n\n- Friday (vendredi)\n\n- Saturday (samedi)\n\n- Sunday (dimanche)\n\n\nVous remarquerez :\n1) qu\'ils commencent tous par une majuscule (il ne faut pas l\'oublier !), contrairement au français\n\n2) qu\'ils se terminent tous par \"day\", qui veut dire \"jour\".\n\n', 2, 6),
(15, 'Savoir compter', '1.Les plus faciles, de 1-10 :\n\n1 one, 2 two, 3 three, 4 four, 5 five, 6 six, 7 seven, 8 eight, 9 nine, 10 ten.\n\n\n\n\n\n2.de 10 à 100, l\'important est de retenir ceux se terminant par zéro.\n\n10 ten, 20 twenty, 30 thirty, 40 forty, 50 fifty, 60 sixty, 70 seventy, 80 eighty, 90 ninety, 100 hundred\n\n\n\n\n\n\n\n2.1. de 10 à 20, ça s\'apprend par cœur aussi\n\n11 eleven, 12 twelve, 13 thirteen, 14 fourteen, 15 fifteen, 16 sixteen, 17 seventeen, 18 eighteen, 19 nineteen.\n\n\n\n2.2.pour les autres nombres composés, on met les nombres se terminant par zéro + un chiffre de 1-10.\n\ntwenty-one, thirty-two, forty-three, fifty-four, etc.', 2, 6),
(16, 'Le présent : La forme affirmative', 'La forme affirmative du present simple se forme : sujet + base verbale + complément. La base verbale correspond à l’infinitif, sans la particule to.\n\nIl faut penser à ajouter un –s ou –es à la troisième personne du singulier lorsque le verbe finit en -o, -s. -x, -ch.', 4, 6),
(17, 'Le présent : La forme négative', 'La forme négative du present simple de forme : sujet + do / does + not + base verbale + complément. Do not et does not peuvent se contracter en don’t et doesn’t.\n\nC’est l’auxiliaire does et non le verbe principal qui porte alors la marque de la troisième personne.', 4, 6),
(18, 'Le présent : La forme interrogative', 'Pour former une question au present simple, il faut inverser le sujet et l’auxiliaire do : do / does + sujet + base verbale + complément.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_it`
--

CREATE TABLE `courses_it` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_it`
--

INSERT INTO `courses_it` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'Articoli determinativi e indeterminativi nel caso accusativo', 'Gli articoli determinativi e indeterminativi nel caso accusativo, come in francese, l\'oggetto diretto tedesco è identificato ponendo le domande \'a chi?\' o \'che cosa?\'. Quando il sostantivo funziona come oggetto diretto nella frase, deve essere nel caso accusativo. È il determinante che prende la marca accusativa.\r\n\r\nQuindi abbiamo: Maschile:\r\n\r\nArticolo determinativo: den\r\nArticolo indeterminativo: einen\r\nFemminile:\r\n\r\nArticolo determinativo: die\r\nArticolo indeterminativo: eine\r\nNeutro:\r\n\r\nArticolo determinativo: das\r\nArticolo indeterminativo: ein\r\nPlurale:\r\n\r\nArticolo determinativo: die\r\nArticolo indeterminativo: keine', 1, 2),
(2, 'Saluti', 'Hallo: Ciao\r\nGuten Morgen: Buongiorno\r\nGuten Tag: Buon pomeriggio\r\nGuten Abend: Buonasera\r\nAuf Wiedersehen: Arrivederci\r\nTschüss: Ciao (informale)', 2, 2),
(3, 'I numeri', 'Eins: Uno\r\nZwei: Due\r\nDrei: Tre\r\nVier: Quattro\r\nFünf: Cinque\r\nSechs: Sei\r\nSieben: Sette\r\nAcht: Otto\r\nNeun: Nove\r\nZehn: Dieci', 2, 2),
(4, 'I giorni della settimana', 'Montag: Lunedì\r\nDienstag: Martedì\r\nMittwoch: Mercoledì\r\nDonnerstag: Giovedì\r\nFreitag: Venerdì\r\nSamstag: Sabato\r\nSonntag: Domenica', 2, 2),
(5, 'I mesi dell\'anno', 'Januar: Gennaio\r\nFebruar: Febbraio\r\nMärz: Marzo\r\nApril: Aprile\r\nMai: Maggio\r\nJuni: Giugno\r\nJuli: Luglio\r\nAugust: Agosto\r\nSeptember: Settembre\r\nOktober: Ottobre\r\nNovember: Novembre\r\nDezember: Dicembre', 2, 2),
(6, 'I membri della famiglia', 'Mutter: Madre\r\nVater: Padre\r\nBruder: Fratello\r\nSchwester: Sorella\r\nGroßmutter: Nonna\r\nGroßvater: Nonno\r\nSohn: Figlio\r\nTochter: Figlia\r\nOnkel: Zio\r\nTante: Zia', 2, 2),
(7, 'I plurali dei nomi', 'In tedesco, per formare il plurale dei nomi, si utilizzano generalmente le seguenti regole:\r\n\r\nAggiungere \"-e\" alla fine della parola: Esempio: \"der Tisch\" (il tavolo) diventa \"die Tische\" (i tavoli).\r\nAggiungere \"-n\" alla fine della parola: Esempio: \"das Buch\" (il libro) diventa \"die Bücher\" (i libri).\r\nAggiungere \"-en\" alla fine della parola: Esempio: \"der Stuhl\" (la sedia) diventa \"die Stühle\" (le sedie).\r\nAlcune parole hanno plurali irregolari: Esempio: \"der Mann\" (l\'uomo) diventa \"die Männer\" (gli uomini).', 3, 2),
(8, 'Maiuscole', 'Maiuscola: Come in francese, la prima lettera di una frase, di un nome proprio o di un titolo è sempre in maiuscolo in tedesco.', 3, 2),
(9, 'Verbi regolari', 'I verbi regolari, anche chiamati verbi \'deboli\', sono verbi che seguono regole standard di coniugazione.\r\nEcco una lista dei verbi deboli più comuni:\r\n\r\narbeiten → lavorare\r\nbauen → costruire\r\nbedienen → (servirsi)\r\nbegleiten → accompagnare\r\nbetrachten → considerare\r\nbewegen → muovere\r\nbesichtigen → visitare\r\nbrauchen → avere bisogno\r\nentdecken → scoprire\r\n(sich) erinnern → ricordare', 4, 2),
(10, 'Verbi irregolari', 'I verbi irregolari, anche noti come \'forti\', non seguono le stesse regole e non rientrano in un insieme specifico di regole o formule.\r\nEcco una lista dei verbi forti più comuni:\r\n\r\nhalten → tenere\r\nschlafen → dormire\r\nfahren → guidare/andare (veicolo)\r\ngeben → dare\r\nessen → mangiare\r\nnehmen → prendere\r\nbeginnen → cominciare\r\nfinden → trovare\r\nbleiben → rimanere\r\nbieten → offrire', 4, 2),
(11, 'L\'articolo indeterminativo', 'A/An corrisponde a \"un/una\" in italiano.\r\nUtilizzato prima di un sostantivo singolare per riferirsi a qualcosa in senso generale.', 1, 6),
(12, 'Articolo determinativo \'The\' / Articolo zero', 'L\'articolo determinativo \'The\' corrisponde a \'il\' o \'la\' in italiano. Viene utilizzato prima di un sostantivo singolare o plurale per riferirsi a qualcosa in modo specifico. Viene pronunciato come \'/ði/\' prima di un suono vocale. Non c\'è una pronuncia specifica prima del suono \'/j/\'.\r\n\r\nL\'articolo zero corrisponde all\'assenza di articolo. Viene utilizzato nei seguenti casi:\r\na) Prima di sostantivi astratti o che rappresentano cose in generale.\r\nb) Nelle preferenze o opinioni.\r\nc) In alcune strutture sintattiche (giorni, mesi, nomi propri, funzioni).', 1, 6),
(13, 'L\'uso delle lettere maiuscole', 'In inglese, le lettere maiuscole (anche chiamate lettere capitali, lettere a stampatello o lettere maiuscole) vengono utilizzate principalmente in questo modo:\r\n\r\nAll\'inizio di una frase\r\nLa regola inglese è la stessa del francese: indipendentemente che la tua frase sia affermativa, negativa, interrogativa o imperativa, devi iniziarla con una lettera maiuscola.\r\n\r\nPer nomi propri, cognomi e soprannomi\r\nTutti i nomi propri, cognomi e altri soprannomi devono iniziare con una lettera maiuscola. Questa regola si applica anche ai nomi affettuosi dati a un membro specifico della famiglia, senza un determinante.\r\n\r\nPer i nomi dei giorni e dei mesi\r\nContrariamente a una credenza comune, i nomi dei giorni e dei mesi sono scritti con lettere maiuscole in inglese. Tuttavia, è il contrario in francese: si inizia sempre con una lettera maiuscola per Monday, Tuesday, Wednesday, Thursday, Friday, Saturday e Sunday, e per January, February, March, April, May, June, July, August, September, October, November e December.\r\n\r\nPer ogni parola importante nel titolo di un\'opera\r\nSi scrive il titolo di un film, libro o altra opera artistica, è necessario inserire una lettera maiuscola all\'inizio e sulla prima parola importante, cioè qualsiasi parola che non sia \"le\", \"la\", \"les\", \"un\", \"du\", ecc. In inglese, la regola è la stessa, ma devi anche mettere in maiuscolo tutte le altre parole importanti nel titolo.\r\n\r\nPer i nomi dei luoghi, nazionalità e lingue\r\nIn inglese, i nomi propri geografici iniziano con una lettera maiuscola. Questa regola si applica a ciascun elemento dello stesso nome.', 3, 6),
(14, 'I 7 giorni della settimana', 'Monday (lunedì)\r\nTuesday (martedì)\r\nWednesday (mercoledì)\r\nThursday (giovedì)\r\nFriday (venerdì)\r\nSaturday (sabato)\r\nSunday (domenica)\r\nNoterai:\r\n\r\nChe tutti iniziano con una lettera maiuscola (non dimenticarlo!), a differenza del francese.\r\nChe tutti terminano con \"day\", che significa \"giorno\".', 2, 6),
(15, 'numero', '1: uno\r\n2: due\r\n3: tre\r\n4: quattro\r\n5: cinque\r\n6: sei\r\n7: sette\r\n8: otto\r\n9: nove\r\n10: dieci\r\n\r\n20: venti\r\n30: trenta\r\n40: quaranta\r\n50: cinquanta\r\n60: sessanta\r\n70: settanta\r\n80: ottanta\r\n90: novanta\r\n100: cento\r\n\r\n11: undici\r\n12: dodici\r\n13: tredici\r\n14: quattordici\r\n15: quindici\r\n16: sedici\r\n17: diciassette\r\n18: diciotto\r\n19: diciannove\r\n20: venti', 2, 6),
(16, 'Il presente: La forma affermativa', 'La forma affermativa del presente semplice si forma così: soggetto + verbo base + complemento. Il verbo base corrisponde all\'infinito, senza la particella \'to\'.\r\n\r\nÈ necessario aggiungere una -s o -es alla terza persona singolare quando il verbo termina in -o, -s, -x, -ch.', 4, 6),
(17, 'Il presente: La forma negativa', '\"La forma negativa del presente semplice si forma così: soggetto + do / does + not + verbo base + complemento. Do not e does not possono essere contratti in don’t e doesn’t.\r\n\r\nÈ l\'ausiliare does e non il verbo principale che porta la marca della terza persona.', 4, 6),
(18, 'Il presente: La forma interrogativa', 'Per formare una domanda nel presente semplice, è necessario invertire il soggetto e l\'ausiliare do: do / does + soggetto + verbo base + complemento.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `courses_ru`
--

CREATE TABLE `courses_ru` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4095) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `courses_ru`
--

INSERT INTO `courses_ru` (`id`, `title`, `description`, `global_category_id`, `language_id`) VALUES
(1, 'Определенные и неопределенные артикли в винительном падеже', 'Определенные и неопределенные артикли в винительном падеже, как и во французском, прямой объект в немецком языке определяется вопросами \'кого?\' или \'что?\'. Когда существительное выполняет функцию прямого объекта в предложении, оно должно находиться в винительном падеже. Определительный артикль приобретает винительное окончание.\r\n\r\nТаким образом, у нас есть: Мужской род:\r\n\r\nОпределенный артикль: den\r\nНеопределенный артикль: einen\r\nЖенский род:\r\n\r\nОпределенный артикль: die\r\nНеопределенный артикль: eine\r\nСредний род:\r\n\r\nОпределенный артикль: das\r\nНеопределенный артикль: ein\r\nМножественное число:\r\n\r\nОпределенный артикль: die\r\nНеопределенный артикль: keine', 1, 2),
(2, 'Приветствия', 'Hallo: Привет\r\nGuten Morgen: Доброе утро\r\nGuten Tag: Добрый день\r\nGuten Abend: Добрый вечер\r\nAuf Wiedersehen: До свидания\r\nTschüss: Пока (неформально)', 2, 2),
(3, 'Числа', 'Eins: Один\r\nZwei: Два\r\nDrei: Три\r\nVier: Четыре\r\nFünf: Пять\r\nSechs: Шесть\r\nSieben: Семь\r\nAcht: Восемь\r\nNeun: Девять\r\nZehn: Десять', 2, 2),
(4, 'Дни недели', 'Montag: Понедельник\r\nDienstag: Вторник\r\nMittwoch: Среда\r\nDonnerstag: Четверг\r\nFreitag: Пятница\r\nSamstag: Суббота\r\nSonntag: Воскресенье', 2, 2),
(5, 'Месяцы года', 'Januar: Январь\r\nFebruar: Февраль\r\nMärz: Март\r\nApril: Апрель\r\nMai: Май\r\nJuni: Июнь\r\nJuli: Июль\r\nAugust: Август\r\nSeptember: Сентябрь\r\nOktober: Октябрь\r\nNovember: Ноябрь\r\nDezember: Декабрь', 2, 2),
(6, 'Члены семьи', 'Mutter: Мать\r\nVater: Отец\r\nBruder: Брат\r\nSchwester: Сестра\r\nGroßmutter: Бабушка\r\nGroßvater: Дедушка\r\nSohn: Сын\r\nTochter: Дочь\r\nOnkel: Дядя\r\nTante: Тётя', 2, 2),
(7, 'Множественное число существительных', 'В немецком языке для образования множественного числа существительных обычно используются следующие правила:\r\n\r\nДобавление \"-e\" в конце слова: Пример: \"der Tisch\" (стол) становится \"die Tische\" (столы).\r\nДобавление \"-n\" в конце слова: Пример: \"das Buch\" (книга) становится \"die Bücher\" (книги).\r\nДобавление \"-en\" в конце слова: Пример: \"der Stuhl\" (стул) становится \"die Stühle\" (стулья).\r\nНекоторые слова имеют неправильные формы множественного числа: Пример: \"der Mann\" (мужчина) становится \"die Männer\" (мужчины).', 3, 2),
(8, 'Заглавные буквы', 'Заглавная буква: Как и на французском языке, первая буква предложения, собственного имени или заголовка всегда пишется с заглавной буквы на немецком языке.', 3, 2),
(9, 'Регулярные глаголы', 'Регулярные глаголы, также называемые \'слабыми\' глаголами, - это глаголы, которые следуют стандартным правилам спряжения.\r\nВот список наиболее распространенных слабых глаголов:\r\n\r\narbeiten → работать\r\nbauen → строить\r\nbedienen → обслуживать (себя)\r\nbegleiten → сопровождать\r\nbetrachten → рассматривать\r\nbewegen → двигаться\r\nbesichtigen → посещать\r\nbrauchen → нуждаться\r\nentdecken → открывать\r\n(sich) erinnern → помнить', 4, 2),
(10, 'Неправильные глаголы', 'Неправильные глаголы, также известные как \'сильные\', не следуют тем же правилам и не вписываются в определенный набор правил или формул.\r\nВот список наиболее распространенных сильных глаголов:\r\n\r\nhalten → держать\r\nschlafen → спать\r\nfahren → ехать/идти (на транспорте)\r\ngeben → давать\r\nessen → есть\r\nnehmen → брать\r\nbeginnen → начинать\r\nfinden → находить\r\nbleiben → оставаться\r\nbieten → предлагать', 4, 2),
(11, 'Неопределенный артикль', 'A/An соответствует \"один/одна\" в русском.\r\nИспользуется перед единственным числом существительного, чтобы указать на что-то в общем смысле.', 1, 6),
(12, 'Определенный артикль \'The\' / Нулевой артикль', 'Определенный артикль \'The\' соответствует \'the\' в французском. Используется перед единственным или множественным существительным, чтобы указать на что-то специфическое. Произносится как \'/ði/\' перед гласным звуком. Нет специального произношения перед звуком \'/j/\'.\r\n\r\nНулевой артикль соответствует отсутствию артикля. Используется в следующих случаях:\r\na) Перед абстрактными существительными или существительными, обозначающими вещи в общем.\r\nb) В предпочтениях или мнениях.\r\nc) В некоторых синтаксических конструкциях (дни, месяцы, имена собственные, функции).', 1, 6),
(13, 'Использование заглавных букв', 'На английском языке заглавные буквы (также называемые заглавными буквами, прописными буквами или прописными буквами) в основном используются следующим образом:\r\n\r\nВ начале предложения\r\nАнглийское правило такое же, как и французское: независимо от того, является ли ваше предложение утвердительным, отрицательным, вопросительным или повелительным, вы должны начинать его с заглавной буквы.\r\n\r\nДля имен, фамилий и прозвищ\r\nВсе имена, фамилии и другие прозвища должны начинаться с заглавной буквы. Это правило также распространяется на привычные имена, данного конкретного члена семьи, без определителя.\r\n\r\nДля названий дней и месяцев\r\nВопреки распространенному мнению, названия дней и месяцев пишутся заглавными буквами на английском языке. Однако это противоположно французскому языку: всегда начинается с заглавной буквы для Monday, Tuesday, Wednesday, Thursday, Friday, Saturday и Sunday, и для January, February, March, April, May, June, July, August, September, October, November и December.\r\n\r\nДля каждого важного слова в названии произведения\r\nНа французском языке при написании названия фильма, книги или другого художественного произведения заглавная буква должна быть поставлена в начале и на первом важном слове, то есть на любом слове, кроме \"le\", \"la\", \"les\", \"un\", \"du\", и т. д. На английском языке правило то же самое, но также нужно поставить заглавные буквы на все остальные важные слова в названии.\r\n\r\nДля названий собственных мест, национальностей и языков\r\nНа английском языке географические собственные имена начинаются с заглавной буквы. Это правило распространяется на каждый элемент того же имени.', 3, 6),
(14, 'Дни недели Семь дней недели на английском языке', 'Monday (понедельник)\r\nTuesday (вторник)\r\nWednesday (среда)\r\nThursday (четверг)\r\nFriday (пятница)\r\nSaturday (суббота)\r\nSunday (воскресенье)\r\n\r\nЗаметим:\r\n\r\nЧто все они начинаются с заглавной буквы (не забудьте об этом!), в отличие от французского.\r\nЧто все они заканчиваются на \"day\", что означает \"день\".', 2, 6),
(15, 'пятнадцать ', '1: один (odin)\r\n2: два (dva)\r\n3: три (tri)\r\n4: четыре (chetyre)\r\n5: пять (pyat\')\r\n6: шесть (shest\')\r\n7: семь (sem\')\r\n8: восемь (vosem\')\r\n9: девять (devyat\')\r\n\r\n10: десять (desyat\')\r\n20: двадцать (dvadtsat\')\r\n30: тридцать (tridtsat\')\r\n40: сорок (sorok)\r\n50: пятьдесят (pyat\'desyat)\r\n60: шестьдесят (shest\'desyat)\r\n70: семьдесят (sem\'desyat)\r\n80: восемьдесят (vosem\'desyat)\r\n90: девяносто (devyanosto)\r\n100: сто (sto)\r\n\r\n10: десять (desyat\')\r\n11: одиннадцать (odinnadtsat\')\r\n12: двенадцать (dvenadtsat\')\r\n13: тринадцать (trinadtsat\')\r\n14: четырнадцать (chetyrnadtsat\')\r\n15: пятнадцать (pyatnadtsat\')\r\n16: шестнадцать (shestnadtsat\')\r\n17: семнадцать (semnadtsat\')\r\n18: восемнадцать (vosemnadtsat\')\r\n19: девятнадцать (devyatnadtsat\')\r\n20: двадцать (dvadtsat\')', 2, 6),
(16, 'Настоящее время: Утвердительная форма', 'Утвердительная форма простого настоящего времени образуется так: подлежащее + основа глагола + дополнение. Основа глагола соответствует инфинитиву, без частицы \'to\'.\r\n\r\nНеобходимо добавить -s или -es к третьему лицу единственного числа, когда глагол оканчивается на -o, -s, -x, -ch.', 4, 6),
(17, 'Настоящее время: Отрицательная форма', 'Отрицательная форма простого настоящего времени образуется так: подлежащее + do / does + not + основа глагола + дополнение. Do not и does not могут сокращаться до don’t и doesn’t.\r\n\r\nЭто вспомогательный глагол does, а не основной глагол, который затем несет маркер третьего лица.', 4, 6),
(18, 'Настоящее время: Вопросительная форма', 'Чтобы сформулировать вопрос в простом настоящем времени, необходимо инвертировать подлежащее и вспомогательный глагол do: do / does + подлежащее + основа глагола + дополнение.', 4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_de`
--

CREATE TABLE `examples_de` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_de`
--

INSERT INTO `examples_de` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief.', 1, 2),
(2, 'Ich sehe den Mann.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\"', 11, 6),
(6, ' \"the book\", \"the apple\", \"the United States\".', 12, 6),
(7, '\"I love English\", \"Cats are the most intelligent animals on Earth\".', 13, 6),
(8, 'The weather is nice.', 13, 6),
(9, 'I’m going to tell Mom !', 13, 6),
(10, 'I’m going to tell your mom.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think.', 13, 6),
(12, 'Lethal Weapon\r\n', 13, 6),
(13, 'North Carolina', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_en`
--

CREATE TABLE `examples_en` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_en`
--

INSERT INTO `examples_en` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief.', 1, 2),
(2, 'Ich sehe den Mann.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\"', 11, 6),
(6, ' \"the book\", \"the apple\", \"the United States\".', 12, 6),
(7, '\"I love English\", \"Cats are the most intelligent animals on Earth\".', 13, 6),
(8, 'The weather is nice.', 13, 6),
(9, 'I’m going to tell Mom !', 13, 6),
(10, 'I’m going to tell your mom.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think.', 13, 6),
(12, 'Lethal Weapon\r\n', 13, 6),
(13, 'North Carolina', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_es`
--

CREATE TABLE `examples_es` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_es`
--

INSERT INTO `examples_es` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief.', 1, 2),
(2, 'Ich sehe den Mann.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\"', 11, 6),
(6, ' \"the book\", \"the apple\", \"the United States\".', 12, 6),
(7, '\"I love English\", \"Cats are the most intelligent animals on Earth\".', 13, 6),
(8, 'The weather is nice.', 13, 6),
(9, 'I’m going to tell Mom !', 13, 6),
(10, 'I’m going to tell your mom.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think.', 13, 6),
(12, 'Lethal Weapon\r\n', 13, 6),
(13, 'North Carolina', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_fr`
--

CREATE TABLE `examples_fr` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_fr`
--

INSERT INTO `examples_fr` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief (COD). / J\'écris la lettre.', 1, 2),
(2, 'Ich sehe den Mann (COD). / Je vois l\'homme.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\" (un livre).', 11, 6),
(6, ' \"the book\" (le livre), \"the apple\" (/i/ apple), \"the United States\" (/i/ United).', 12, 6),
(7, '\"I love English\" (J\'adore l\'anglais), \"Cats are the most intelligent animals on Earth\" (Les chats sont les animaux les plus intelligents sur Terre).', 13, 6),
(8, 'The weather is nice. → Il fait beau.', 13, 6),
(9, 'I’m going to tell Mom !  → Je vais le dire à maman !', 13, 6),
(10, 'I’m going to tell your mom. → Je vais le dire à ta maman.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think. → Je l’ai rencontrée en septembre dernier. C’était un mardi, je crois.', 13, 6),
(12, 'Lethal Weapon → L’Arme fatale\r\n\r\n', 13, 6),
(13, 'North Carolina → Caroline du Nord', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_it`
--

CREATE TABLE `examples_it` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_it`
--

INSERT INTO `examples_it` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief.', 1, 2),
(2, 'Ich sehe den Mann.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\"', 11, 6),
(6, ' \"the book\", \"the apple\", \"the United States\".', 12, 6),
(7, '\"I love English\", \"Cats are the most intelligent animals on Earth\".', 13, 6),
(8, 'The weather is nice.', 13, 6),
(9, 'I’m going to tell Mom !', 13, 6),
(10, 'I’m going to tell your mom.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think.', 13, 6),
(12, 'Lethal Weapon\r\n', 13, 6),
(13, 'North Carolina', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `examples_ru`
--

CREATE TABLE `examples_ru` (
  `id` int(11) NOT NULL,
  `description` varchar(1023) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `examples_ru`
--

INSERT INTO `examples_ru` (`id`, `description`, `course_id`, `language_id`) VALUES
(1, 'Ich schreibe den Brief.', 1, 2),
(2, 'Ich sehe den Mann.', 1, 2),
(3, 'Das ist mein Hund.', 16, 2),
(4, 'Mein Name ist Peter.', 16, 2),
(5, '\"a book\"', 11, 6),
(6, ' \"the book\", \"the apple\", \"the United States\".', 12, 6),
(7, '\"I love English\", \"Cats are the most intelligent animals on Earth\".', 13, 6),
(8, 'The weather is nice.', 13, 6),
(9, 'I’m going to tell Mom !', 13, 6),
(10, 'I’m going to tell your mom.', 13, 6),
(11, 'I met her last September. It was on a Tuesday, I think.', 13, 6),
(12, 'Lethal Weapon\r\n', 13, 6),
(13, 'North Carolina', 13, 6),
(14, 'Voici mon meilleur ami : c’est un Marocain.', 13, 6),
(15, 'to go = he goes', 16, 6),
(16, 'to miss = she misses', 16, 6),
(17, 'I don’t walk to work every day.', 17, 6),
(18, 'Do you walk to work every day?', 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_de`
--

CREATE TABLE `exercices_de` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_de`
--

INSERT INTO `exercices_de` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, '', 'einfach', 'Wonach suchen Sie? Ich suche __ Eingang.Was suchen Sie? Ich suche \n__ Eingang. (der Eingang / article défini)', 'den', 'den', 1, 1, 2),
(2, '', 'einfach', 'Kennst du __ Lehrerin? ', 'die', 'die', 1, 1, 2),
(3, '', 'einfach', 'Die Kinder haben __ Buch gelesen.', 'ein', 'ein', 1, 1, 2),
(4, '', 'mittel', 'Heute werde ich __ Schuhe kaufen, die ich letztes Mal gesehen habe. ', 'die', 'die', 1, 1, 2),
(5, '', 'einfach', 'Siehst du __ Haus? ', 'das', 'das', 1, 1, 2),
(6, 'Die Begrüßungen', 'einfach', 'Übersetzung nicht verfügbar', 'Hallo', 'Hallo', 2, 2, 2),
(7, 'Die Begrüßungen', 'einfach', 'Übersetzung nicht verfügbar', 'Auf Wiedersehen\r\n\r\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Die Begrüßungen', 'einfach', 'Übersetzung nicht verfügbar', 'Tschüss', 'Tschüss', 2, 2, 2),
(9, 'Die Zahlen\"', 'einfach', 'Übersetzung nicht verfügbar', 'Drei', 'Drei', 2, 3, 2),
(10, 'Die Zahlen\"', 'einfach', 'Übersetzung nicht verfügbar', 'Sieben', 'Sieben', 2, 3, 2),
(11, 'Die Wochentage', 'einfach', 'Übersetzung nicht verfügbar', 'Mercredi', 'Mercredi', 2, 4, 2),
(12, 'Die Wochentage', 'einfach', 'Übersetzung nicht verfügbar', 'Mercredi', 'Mercredi', 2, 5, 2),
(13, 'Die Pluralformen', 'mittel', 'Was ist der Plural von dem Wort \'der Stift\' auf Deutsch?', 'die Stifte', 'die Stifte', 3, 7, 2),
(14, 'Die Pluralformen', 'moyen', 'Wie bildet man den Plural des Wortes \'die Blume\' (die Blume) auf Deutsch?', 'die Blumen', 'die Blumen', 3, 7, 2),
(15, 'Die Großbuchstaben', 'einfach', 'traduction non disponible', ' Hund', ' Hund', 3, 8, 2),
(16, 'Die Großbuchstaben', 'einfach', 'Wann sollte man einen Großbuchstaben für Substantive im Deutschen verwenden?', 'Toujours', 'Toujours', 3, 8, 2),
(17, 'Die regelmäßigen Verben', 'mittel', 'Übersetzung nicht verfügbar', 'arbeiten', 'arbeiten', 4, 9, 2),
(18, 'Die regelmäßigen Verben', 'mittel', 'Übersetzung nicht verfügbar', 'entdecken', 'entdecken', 4, 10, 2),
(19, 'Die unregelmäßigen Verben', 'mittel', 'Übersetzung nicht verfügbar', 'essen', 'essen', 4, 10, 2),
(20, 'Die unregelmäßigen Verben', 'mittel', 'Übersetzung nicht verfügbar', 'bleiben', 'bleiben', 4, 10, 2),
(21, 'L\'article indéfini \"A/An\"', 'mittel', 'I\'ve just bought __ book.', 'a', 'a', 1, 11, 6),
(22, 'Der unbestimmte Artikel \"A/An', 'mittel', 'My sister is __ nurse.', 'a', 'a', 1, 11, 6),
(23, 'Der unregelmäßigen Artikel \"A/An', 'mittel', '__ animal.', 'An', 'An', 1, 11, 6),
(24, 'Der bestimmte Artikel \"The\" / Nullartikel', 'mittel', 'I don\'t like __ chocolate.', '', '', 1, 12, 6),
(25, 'Der bestimmte Artikel \"The\" / Nullartikel', 'mittel', '__ car in front of the house is a Ferrari.', 'the', 'The', 1, 12, 6),
(26, 'Der bestimmte Artikel \"The\" / Nullartikel', 'mittel', 'Please give me __ orange you\'ve just brought', 'the', 'the', 1, 12, 6),
(27, 'Die Großbuchstaben', 'mittel', 'Wann sollte man im Englischen einen Großbuchstaben am Anfang eines Satzes verwenden?', 'immer', 'immer', 3, 13, 6),
(28, 'Die Großbuchstaben', 'einfach', 'Wie schreibt man Eigennamen auf Englisch? .', 'in Großbuchstaben', 'in Großbuchstaben', 3, 13, 6),
(29, 'Zählen können', 'einfach', 'Wie sagt man \'10\' auf Englisch?', 'ten', 'ten', 2, 15, 6),
(30, 'Zählen können', 'einfach', 'Welche Zahl endet mit \"ty\" und repräsentiert \"40\"?', 'forty', 'forty', 2, 15, 6),
(31, 'Zählen können', 'einfach', 'Welche Zahl kommt zwischen \"eleven\" und \"thirteen\"?', 'Twelve', 'Twelve', 2, 15, 6),
(32, 'Zählen können', 'einfach', 'Was ist die englische Zahl für \"17\"?', 'Seventeen', 'Seventeen', 2, 15, 6),
(33, 'Die bejahende Form', 'schwer', 'She __ (to sing) in the choir.', 'Sings', 'Sings', 4, 16, 6),
(34, 'Die bejahende Form', 'schwer', 'They __ (to play) soccer on Sundays.', 'Play', 'Play', 4, 16, 6),
(35, 'Die verneinte Form', 'schwer', 'She __ __ (to speak) Spanish fluently. (négation)', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'Die verneinte Form', 'schwer', 'He __ __ (to like) meat.', 'Does not like (doesn\'t)', 'Does not like', 4, 17, 6),
(37, 'Die Frageform', 'mittel', 'What __ they (to watch) on TV?', 'Do', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_en`
--

CREATE TABLE `exercices_en` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_en`
--

INSERT INTO `exercices_en` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, '', 'easy', 'What are you looking for? I\'m looking for the entrance.\nWas suchen Sie? Ich suche \n__ Eingang. (der Eingang / article défini)', 'The right answer is : \"den\"', 'den', 1, 1, 2),
(2, '', 'easy', 'Do youh know this teacher ?\r\nKennst du __ Lehrerin? ', 'die', 'die', 1, 1, 2),
(3, '', 'easy', 'The children have read a book.\nDie Kinder haben __ Buch gelesen.', 'ein', 'ein', 1, 1, 2),
(4, '', 'medium', 'Today, I\'m going to buy the shoes that I saw last time.\r\nWerde ich __ Schuhe kaufen, die ich letztes Mal gesehen habe. ', 'die', 'die', 1, 1, 2),
(5, '', 'easy', 'Do you see the house ?\nSiehst du __ Haus? ', 'das', 'das', 1, 1, 2),
(6, 'Greetings', 'easy', 'Comment dites-vous \"Bonjour\" en allemand ?', 'Hallo', 'Hallo', 2, 2, 2),
(7, 'Greetings', 'easy', 'What is the translation of \'Auf Wiedersehen\' in German?', 'Auf Wiedersehen\r\n\r\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Greetings', 'easy', 'How do you say \'Hi\' informally in German?', 'Tschüss', 'Tschüss', 2, 2, 2),
(9, 'The numbers', 'easy', 'What is the German number for \"three\"?', 'Drei', 'Drei', 2, 3, 2),
(10, 'The numbers', 'easy', 'How do you say \'seven\' in German?', 'Sieben', 'Sieben', 2, 3, 2),
(11, 'The days of the week', 'easy', 'Which day of the week is \"Mittwoch\"?', 'wednesay', 'wednesay', 2, 4, 2),
(12, 'The days of the week', 'easy', 'How do you say \'Sunday\' in German?', 'Sonntag\n', 'Sonntag\n', 2, 4, 2),
(13, 'Plurals of nouns', 'medium', 'What is the plural of the word \"der Stift\" (the pencil) in German?', 'die Stifte', 'die Stifte', 3, 7, 2),
(14, 'Plurals of nouns', 'medium', 'How is the plural of the word \"die Blume\" (the flower) formed in German?', 'die Blumen', 'die Blumen', 3, 7, 2),
(15, 'Capital letters', 'easy', 'What is the correctly capitalized word in the following sentence: \"ich habe einen Hund.\"?', ' Hund', ' Hund', 3, 8, 2),
(16, 'Capital letters', 'easy', 'Quand doit-on utiliser une majuscule pour les noms communs en allemand ?', 'Toujours', 'Toujours', 3, 8, 2),
(17, 'Regular verbs', 'medium', 'What is the German verb corresponding to \"travailler\" in the list of most common weak verbs?', 'arbeiten', 'arbeiten', 4, 9, 2),
(18, 'Irregular verbs', 'medium', 'Quel verbe allemand signifie \"découvrir\" parmi les verbes faibles énumérés ?', 'entdecken', 'entdecken', 4, 10, 2),
(19, 'Irregular verbs', 'medium', 'Which German verb means \"to discover', 'essen', 'essen', 4, 10, 2),
(20, 'Irregular verbs', 'medium', 'What is the German verb corresponding to \"rester\" in the listed strong verbs?', 'bleiben', 'bleiben', 4, 10, 2),
(21, 'The indefinite article', 'medium', 'I\'ve just bought __ book.', 'a', 'a', 1, 11, 6),
(22, 'The indefinite article', 'medium', 'My sister is __ nurse.', 'a', 'a', 1, 11, 6),
(23, 'The indefinite article\n', 'easy', '__ animal.', 'An', 'An', 1, 11, 6),
(24, 'The definite article \'The\' / Zero article', 'medium', 'I don\'t like __ chocolate.', '', '', 1, 12, 6),
(25, 'The definite article \'The\' / Zero article', 'medium', '__ car in front of the house is a Ferrari.', 'Il s\'agit d\'une voiture précise: celle qui est devant la maison => article défini THE', 'The', 1, 12, 6),
(26, 'The definite article \'The\' / Zero article', 'medium', 'Please give me __ orange you\'ve just brought.', 'the', 'the', 1, 12, 6),
(27, 'Capital Letters', 'medium', 'When should one use a capital letter at the beginning of a sentence in English?', 'On doit TOUJOURS utiliser une majuscule au début d\'une phrase', 'Toujours', 3, 13, 6),
(28, 'Capital Letters', 'easy', 'How should proper nouns be written in English? In __\"', 'En majuscule', 'majuscule', 3, 13, 6),
(29, 'Numbers', 'easy', 'How do you say \"10\" in English?', 'ten', 'ten', 2, 15, 6),
(30, 'Numbers', 'easy', 'What is the number ending in \"ty\" that represents \"40\"?', 'forty', 'forty', 2, 15, 6),
(31, 'Numbers', 'easy', 'Which number is between \"eleven\" and \"thirteen\"?', 'Twelve', 'Twelve', 2, 15, 6),
(32, 'Numbers', 'easy', 'What is the English number for \"17\"?', 'Seventeen', 'Seventeen', 2, 15, 6),
(33, 'The present: The affirmative form', 'hard', 'She __ (to sing) in the choir.', 'Sings', 'Sings', 4, 16, 6),
(34, 'The present: The affirmative form', 'hard', 'They __ (to play) soccer on Sundays.', 'Play', 'Play', 4, 16, 6),
(35, 'The present: The affirmative form', 'hard', 'She __ __ (to speak) Spanish fluently. (négation)', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'The present: The affirmative form', 'hard', 'He __ __ (to like) meat.', 'Does not like (doesn\'t)', 'Does not like', 4, 17, 6),
(37, 'The present: The interrogative form', 'medium', 'What __ they (to watch) on TV?', 'Do', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_es`
--

CREATE TABLE `exercices_es` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_es`
--

INSERT INTO `exercices_es` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, 'Los artículos definidos e indefinidos en el caso acusativo.', 'fácil', '¿Qué buscas? Estoy buscando la entrada.\nWas suchen Sie? Ich suche \n__ Eingang. (der Eingang / article défini)', 'den', 'den', 1, 1, 2),
(2, 'Los artículos definidos e indefinidos en el caso acusativo.', 'fácil', '¿Conoces al profesor?\nKennst du __ Lehrerin? ', 'die', 'die', 1, 1, 2),
(3, 'Los artículos definidos e indefinidos en el caso acusativo.', 'fácil', 'Los niños han leído un libro.\nDie Kinder haben __ Buch gelesen.', 'ein', 'ein', 1, 1, 2),
(4, 'Los artículos definidos e indefinidos en el caso acusativo.', 'medio', 'Hoy voy a comprar los zapatos que vi la última vez.\nHeute werde ich __ Schuhe kaufen, die ich letztes Mal gesehen habe. ', 'die', 'die', 1, 1, 2),
(5, 'Los artículos definidos e indefinidos en el caso acusativo.', 'fácil', '¿Ves la casa?\nSiehst du __ Haus? ', 'das', 'das', 1, 1, 2),
(6, 'Saludos', 'fácil', '¿Cómo se dice \"Bonjour\" en alemán?', 'Hallo', 'Hallo', 2, 2, 2),
(7, 'Saludos', 'fácil', '¿Cuál es la traducción de \"Au revoir\" en alemán?', 'Auf Wiedersehen\r\n\r\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Saludos', 'fácil', '\"¿Cómo se dice \"Hola\" de forma informal en alemán?', 'Tschüss', 'Tschüss', 2, 2, 2),
(9, 'Los números', 'fácil', '¿Cuál es el número alemán para \"tres\"?', 'Drei', 'Drei', 2, 3, 2),
(10, 'Los números', 'fácil', '¿Cómo se dice \"siete\" en alemán?', 'Sieben', 'Sieben', 2, 3, 2),
(11, 'Los días de la semana', 'fácil', '¿Qué día de la semana es \"Mittwoch\"?', 'miercoles', 'miercoles', 2, 4, 2),
(12, 'Los días de la semana', 'fácil', '¿Cómo se dice \"dimanche\" en alemán?', 'Sonntag\n', 'Sonntag\n', 2, 4, 2),
(13, 'Plurales de los nombres', 'medio', '¿Cuál es el plural de la palabra \"der Stift\" (el lápiz) en alemán?', 'die Stifte', 'die Stifte', 3, 7, 2),
(14, 'Plurales de los nombres', 'medio', '¿Cómo se forma el plural de la palabra \"die Blume\" (la flor) en alemán?', 'die Blumen', 'die Blumen', 3, 7, 2),
(15, 'Mayúsculas', 'fácil', '¿Cuál es la palabra correctamente capitalizada en la siguiente frase: \"ich habe einen Hund.\"?', ' Hund', ' Hund', 3, 8, 2),
(16, 'Mayúsculas', 'fácil', '¿Cuándo se debe usar mayúscula para los nombres comunes en alemán?', 'siempre', 'siempre', 3, 8, 2),
(17, 'Verbos regulares', 'medio', '¿Cuál es el verbo alemán correspondiente a \"trabajar\" en la lista de los verbos débiles más comunes?', 'arbeiten', 'arbeiten', 4, 9, 2),
(18, 'Verbos irregulares', 'medio', '¿Qué verbo alemán significa \"descubrir\" entre los verbos débiles enumerados?', 'entdecken', 'entdecken', 4, 10, 2),
(19, 'Verbos irregulares', 'medio', '¿Qué verbo alemán significa \"comer\" entre los verbos fuertes más comunes?', 'essen', 'essen', 4, 10, 2),
(20, 'Verbos irregulares', 'medio', '¿Cuál es el verbo alemán correspondiente a \"rester\" en la lista de los verbos fuertes enumerados?', 'bleiben', 'bleiben', 4, 10, 2),
(21, 'El artículo indefinido', 'medio', 'I\'ve just bought __ book.', 'a', 'a', 1, 11, 6),
(22, 'El artículo indefinido', 'medio', 'My sister is __ nurse.', 'a', 'a', 1, 11, 6),
(23, 'El artículo indefinido', 'fácil', '__ animal.', 'An', 'An', 1, 11, 6),
(24, 'El artículo definido \'The\' / Artículo cero', 'medio', 'I don\'t like __ chocolate.', '', '', 1, 12, 6),
(25, 'El artículo definido \'The\' / Artículo cero', 'medio', '__ car in front of the house is a Ferrari.', 'The', 'The', 1, 12, 6),
(26, 'El artículo definido \'The\' / Artículo cero', 'medio', 'Please give me __ orange you\'ve just brought.', 'the', 'the', 1, 12, 6),
(27, 'Mayúsculas', 'medio', '¿Cuándo se debe usar mayúscula al principio de una oración en inglés?', 'siempre', 'siempre', 3, 13, 6),
(28, 'Mayúsculas', 'fácil', '¿Cómo se deben escribir los nombres propios en inglés? En __', 'En mayúscula', 'En mayúscula', 3, 13, 6),
(29, 'Los números', 'fácil', '¿Cómo se dice \"10\" en inglés?', 'ten', 'ten', 2, 15, 6),
(30, 'Los números', 'fácil', '¿Cuál es el número que termina en \"ty\" y representa \"40\"?', 'forty', 'forty', 2, 15, 6),
(31, 'Los números', 'fácil', '¿Qué número se encuentra entre \"eleven\" y \"thirteen\"?', 'Twelve', 'Twelve', 2, 15, 6),
(32, 'Los números', 'fácil', '¿Cuál es el número en inglés para \"17\"?', 'Seventeen', 'Seventeen', 2, 15, 6),
(33, 'El presente: La forma afirmativa', 'difícil', 'She __ (to sing) in the choir.', 'Sings', 'Sings', 4, 16, 6),
(34, 'El presente: La forma afirmativa', 'difícil', 'They __ (to play) soccer on Sundays.', 'Play', 'Play', 4, 16, 6),
(35, 'El presente: La forma negativa', 'difícil', 'She __ __ (to speak) Spanish fluently. (négation)', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'El presente: La forma negativa', 'difícil', 'He __ __ (to like) meat.', 'Does not like (doesn\'t)', 'Does not like', 4, 17, 6),
(37, 'El presente: La forma interrogativa', 'medio', 'What __ they (to watch) on TV?', 'Do', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_fr`
--

CREATE TABLE `exercices_fr` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_fr`
--

INSERT INTO `exercices_fr` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, 'l\'article défini et indéfini en accusatif', 'facile', 'Que cherchez-vous ? Je cherche l\'entrée.\r\nWas suchen Sie? Ich suche \r\n__ Eingang. (der Eingang / article défini)', 'La bonne réponse est : \"den\"', 'den', 1, 1, 2),
(2, 'l\'article défini et indéfini en accusatif', 'facile', 'Connais-tu le professeur ?\r\nKennst du __ Lehrerin? ', '(die Lehrerin / article défini)', 'die', 1, 1, 2),
(3, 'l\'article défini et indéfini en accusatif', 'facile', 'Les enfants ont lu un livre.\r\nDie Kinder haben __ Buch gelesen.', '(das Buch / article indéfini)', 'ein', 1, 1, 2),
(4, 'l\'article défini et indéfini en accusatif', 'moyen', 'Aujourd\'hui, je vais acheter les chaussures que j\'ai vues la dernière fois.\r\nHeute werde ich __ Schuhe kaufen, die ich letztes Mal gesehen habe. ', '(Pluriel / article défini)', 'die', 1, 1, 2),
(5, 'l\'article défini et indéfini en accusatif', 'facile', 'Vois-tu la maison ?\r\nSiehst du __ Haus? ', '(das Haus / article défini)', 'das', 1, 1, 2),
(6, 'Les salutations :', 'facile', 'Comment dites-vous \"Bonjour\" en allemand ?', 'Hallo', 'Hallo', 2, 2, 2),
(7, 'Les salutations :', 'facile', 'Quelle est la traduction de \"Au revoir\" en allemand ?', 'Auf Wiedersehen\r\n\r\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Les salutations :', 'facile', 'Comment dit-on \"Salut\" de manière informelle en allemand ?', 'Tschüss', 'Tschüss', 2, 2, 2),
(9, 'Les nombres :', 'facile', 'Quel est le chiffre allemand pour \"trois\" ?\r\n', 'Drei', 'Drei', 2, 3, 2),
(10, 'Les nombres :', 'facile', 'Comment dit-on \"sept\" en allemand ?', 'Sieben', 'Sieben', 2, 3, 2),
(11, 'Les jours de la semaine :', 'facile', 'Quel jour de la semaine est \"Mittwoch\" ?', 'Mercredi', 'Mercredi', 2, 4, 2),
(12, 'Les jours de la semaine :', 'facile', 'Comment dit-on \"dimanche\" en allemand ?', 'Mercredi', 'Mercredi', 2, 4, 2),
(13, 'Les pluriels', 'moyen', 'Quel est le pluriel du mot \"der Stift\" (le crayon) en allemand ?', 'die Stifte', 'die Stifte', 3, 7, 2),
(14, 'Les pluriels', 'moyen', 'Comment forme-t-on le pluriel du mot \"die Blume\" (la fleur) en allemand ?', 'die Blumen', 'die Blumen', 3, 7, 2),
(15, 'Les majuscules', 'facile', 'Quel est le mot correctement capitalisé dans la phrase suivante : \"ich habe einen Hund.\" ?', ' Hund', ' Hund', 3, 8, 2),
(16, 'Les majuscules', 'facile', 'Quand doit-on utiliser une majuscule pour les noms communs en allemand ?', 'Toujours', 'Toujours', 3, 8, 2),
(17, 'Les verbes réguliers', 'moyen', 'Quel est le verbe allemand correspondant à \"travailler\" dans la liste des verbes faibles les plus courants ?', 'arbeiten', 'arbeiten', 4, 9, 2),
(18, 'Les verbes irréguliers', 'moyen', 'Quel verbe allemand signifie \"découvrir\" parmi les verbes faibles énumérés ?', 'entdecken', 'entdecken', 4, 10, 2),
(19, 'Les verbes irréguliers', 'moyen', 'Quel verbe allemand signifie \"manger\" parmi les verbes forts les plus courants ?', 'essen', 'essen', 4, 10, 2),
(20, 'Les verbes irréguliers', 'moyen', 'Quel est le verbe allemand correspondant à \"rester\" dans la liste des verbes forts énumérés ?', 'bleiben', 'bleiben', 4, 10, 2),
(21, 'L\'article indéfini \"A/An\"', 'moyen', 'I\'ve just bought __ book. (to buy = acheter; book = livre)', 'son consonne => a', 'a', 1, 11, 6),
(22, 'L\'article indéfini \"A/An\"', 'moyen', 'My sister is __ nurse. (to be= être; nurse = infirmière)', 'a', 'a', 1, 11, 6),
(23, 'L\'article indéfini \"A/An\"', 'facile', '__ animal.', 'An', 'An', 1, 11, 6),
(24, 'L\'article défini \"The\" / L\'article zéro', 'moyen', 'I don\'t like __ chocolate.', '', '', 1, 12, 6),
(25, 'L\'article défini \"The\" / L\'article zéro', 'moyen', '__ car in front of the house is a Ferrari. (in front of = devant; house = maison)', 'Il s\'agit d\'une voiture précise: celle qui est devant la maison => article défini THE', 'The', 1, 12, 6),
(26, 'L\'article défini \"The\" / L\'article zéro', 'moyen', 'Please give me __ orange you\'ve just brought. (to give = donner; bring= apporter)', 'the', 'the', 1, 12, 6),
(27, 'Les majuscules', 'moyen', 'Quand doit-on utiliser une majuscule au début d\'une phrase en anglais ?', 'On doit TOUJOURS utiliser une majuscule au début d\'une phrase', 'Toujours', 3, 13, 6),
(28, 'Les majuscules', 'facile', 'Comment doit-on écrire les noms propres en anglais ? En __', 'En majuscule', 'majuscule', 3, 13, 6),
(29, 'Savoir compter', 'facile', 'Comment dit-on \"10\" en anglais ?', 'ten', 'ten', 2, 15, 6),
(30, 'Savoir compter', 'facile', 'Quel est le nombre qui se termine par \"ty\" et qui représente \"40\" ?', 'forty', 'forty', 2, 15, 6),
(31, 'Savoir compter', 'facile', 'Quel nombre se trouve entre \"eleven\" et \"thirteen\" ?', 'Twelve', 'Twelve', 2, 15, 6),
(32, 'Savoir compter', 'facile', 'Quel est le nombre anglais pour \"17\" ?', 'Seventeen', 'Seventeen', 2, 15, 6),
(33, 'La forme affirmative', 'difficle', 'She __ (to sing) in the choir.', 'Sings', 'Sings', 4, 16, 6),
(34, 'La forme affirmative', 'difficle', 'They __ (to play) soccer on Sundays.', 'Play', 'Play', 4, 16, 6),
(35, 'La forme négative', 'difficle', 'She __ __ (to speak) Spanish fluently. (négation)', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'La forme négative', 'difficle', 'He __ __ (to like) meat.', 'Does not like (doesn\'t)', 'Does not like', 4, 17, 6),
(37, 'La forme intérrogative', 'moyen', 'What __ they (to watch) on TV?', 'Do', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_it`
--

CREATE TABLE `exercices_it` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_it`
--

INSERT INTO `exercices_it` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, 'Articoli determinativi e indeterminativi nel caso accusativo', 'facile', 'Che cosa state cercando? Sto cercando l\'ingresso.\nWas suchen Sie? Ich suche \n__ Eingang. (der Eingang / article défini)', 'den', 'den', 1, 1, 2),
(2, 'Articoli determinativi e indeterminativi nel caso accusativo', 'facile', 'Conosci il professore?\nKennst du __ Lehrerin? ', 'die', 'die', 1, 1, 2),
(3, 'Articoli determinativi e indeterminativi nel caso accusativo', 'facile', 'I bambini hanno letto un libro.\nDie Kinder haben __ Buch gelesen.', 'ein', 'ein', 1, 1, 2),
(4, 'Articoli determinativi e indeterminativi nel caso accusativo', 'medio', 'Oggi vado a comprare le scarpe che ho visto l\'ultima volta.\nHeute werde ich __ Schuhe kaufen, die ich letztes Mal gesehen habe. ', 'die', 'die', 1, 1, 2),
(5, 'Articoli determinativi e indeterminativi nel caso accusativo', 'facile', 'Vedi la casa?\nSiehst du __ Haus? ', 'das', 'das', 1, 1, 2),
(6, 'Saluti', 'facile', 'Come si dice \'Buongiorno\' in tedesco?', 'Hallo', 'Hallo', 2, 2, 2),
(7, 'Saluti', 'facile', 'Qual è la traduzione di \"Auf Wiedersehen\" in tedesco?', 'Auf Wiedersehen\r\n\r\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Saluti', 'facile', 'Come si dice \"Ciao\" in modo informale in tedesco?', 'Tschüss', 'Tschüss', 2, 2, 2),
(9, 'I numeri', 'facile', 'Qual è il numero tedesco per \"tre\"?', 'Drei', 'Drei', 2, 2, 2),
(10, 'I numeri', 'facile', 'Come si dice \"sette\" in tedesco?', 'Sieben', 'Sieben', 2, 2, 2),
(11, 'I giorni della settimana', 'facile', 'Che giorno della settimana è \"Mittwoch\"?', 'Mercoledì', 'Mercoledì', 2, 2, 2),
(12, 'I giorni della settimana', 'facile', 'Come si dice \"domenica\" in tedesco?', 'Sonntag', 'Sonntag', 2, 2, 2),
(13, 'I plurali dei nomi', 'medio', 'Qual è il plurale della parola \"der Stift\" (la matita) in tedesco?', 'die Stifte', 'die Stifte', 3, 3, 2),
(14, 'I plurali dei nomi', 'medio', 'Come si forma il plurale della parola \"die Blume\" (il fiore) in tedesco?', 'die Blumen', 'die Blumen', 3, 3, 2),
(15, 'Maiuscole', 'facile', 'Qual è la parola correttamente maiuscola nella seguente frase: \"ich habe einen Hund.\"?', ' Hund', ' Hund', 3, 3, 2),
(16, 'Maiuscole', 'facile', 'Quando si deve usare la maiuscola per i nomi comuni in tedesco?', 'Sempre', 'Sempre', 3, 3, 2),
(17, 'Verbi regolari', 'medio', 'Qual è il verbo tedesco corrispondente a \"lavorare\" nell\'elenco dei verbi deboli più comuni?', 'arbeiten', 'arbeiten', 4, 4, 2),
(18, 'Verbi irregolari', 'medio', 'Quale verbo tedesco significa \"scoprire\" tra i verbi deboli elencati?', 'entdecken', 'entdecken', 4, 4, 2),
(19, 'Verbi irregolari', 'medio', 'Qual è il verbo tedesco che significa \"mangiare\" tra i verbi forti più comuni?', 'essen', 'essen', 4, 4, 2),
(20, 'Verbi irregolari', 'medio', 'Qual è il verbo tedesco corrispondente a \"rimanere\" nell\'elenco dei verbi forti?', 'bleiben', 'bleiben', 4, 4, 2),
(21, 'L\'articolo indeterminativo', 'medio', 'I\'ve just bought __ book.', 'a', 'a', 1, 11, 6),
(22, 'L\'articolo indeterminativo', 'medio', 'My sister is __ nurse.', 'a', 'a', 1, 11, 6),
(23, 'L\'articolo indeterminativo', 'facile', '__ animal.', 'An', 'An', 1, 11, 6),
(24, 'Articolo determinativo \'The\' / Articolo zero', 'medio', 'I don\'t like __ chocolate.', '', '', 1, 12, 6),
(25, 'Articolo determinativo \'The\' / Articolo zero', 'medio', '__ car in front of the house is a Ferrari.', 'The', 'The', 1, 12, 6),
(26, 'Articolo determinativo \'The\' / Articolo zero', 'medio', 'Please give me __ orange you\'ve just brought.', 'the', 'the', 1, 12, 6),
(27, 'Maiuscole', 'medio', 'Quando si deve usare una maiuscola all\'inizio di una frase in inglese?', 'sempre', 'sempre', 3, 13, 6),
(28, 'Maiuscole', 'facile', 'Come si devono scrivere i nomi propri in inglese? In __', 'In maiuscolo\n', 'maiuscolo\n', 3, 13, 6),
(29, 'I numeri', 'facile', 'Come si dice \"10\" in inglese?', 'ten', 'ten', 2, 15, 6),
(30, 'I numeri', 'facile', 'Qual è il numero che termina con \"ty\" e rappresenta \"40\"?', 'forty', 'forty', 2, 15, 6),
(31, 'I numeri', 'facile', 'Quale numero si trova tra \"eleven\" e \"thirteen\"?', 'Twelve', 'Twelve', 2, 15, 6),
(32, 'I numeri', 'facile', 'Qual è il numero inglese per \"17\"?', 'Seventeen', 'Seventeen', 2, 15, 6),
(33, 'Il presente: La forma affermativa', 'difficle', 'She __ (to sing) in the choir.', 'Sings', 'Sings', 4, 16, 6),
(34, 'Il presente: La forma affermativa', 'difficle', 'They __ (to play) soccer on Sundays.', 'Play', 'Play', 4, 16, 6),
(35, 'Il presente: La forma negativa', 'difficle', 'She __ __ (to speak) Spanish fluently. (négation)', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'Il presente: La forma negativa', 'difficle', 'He __ __ (to like) meat.', 'Does not like (doesn\'t)', 'Does not like', 4, 17, 6),
(37, 'Il presente: La forma interrogativa', 'medio', 'What __ they (to watch) on TV?', 'Do', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `exercices_reasons`
--

CREATE TABLE `exercices_reasons` (
  `id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exercices_ru`
--

CREATE TABLE `exercices_ru` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  `question` varchar(4095) NOT NULL,
  `correction_text` varchar(511) NOT NULL,
  `correction` varchar(1023) NOT NULL,
  `global_category_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `exercices_ru`
--

INSERT INTO `exercices_ru` (`id`, `title`, `difficulty`, `question`, `correction_text`, `correction`, `global_category_id`, `course_id`, `language_id`) VALUES
(1, 'Определенные и неопределенные артикли в винительном падеже', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'den', 1, 1, 2),
(2, 'Определенные и неопределенные артикли в винительном падеже', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'die', 1, 1, 2),
(3, 'Определенные и неопределенные артикли в винительном падеже', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'ein', 1, 1, 2),
(4, 'Определенные и неопределенные артикли в винительном падеже', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'die', 1, 1, 2),
(5, 'Определенные и неопределенные артикли в винительном падеже', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'das', 1, 1, 2),
(6, 'Приветствия', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Hallo', 2, 2, 2),
(7, 'Приветствия', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент\n', 'Auf Wiedersehen', 2, 2, 2),
(8, 'Приветствия', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Tschüss', 2, 2, 2),
(9, 'Les nombres :', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Drei', 2, 3, 2),
(10, 'Неопределенный артикль', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Sieben', 2, 3, 2),
(11, 'Неопределенный артикль', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Mercredi', 2, 4, 2),
(12, 'Неопределенный артикль', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Mercredi', 2, 4, 2),
(13, 'Неправильные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'die Stifte', 3, 7, 2),
(14, 'Неправильные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'die Blumen', 3, 7, 2),
(15, 'Заглавные буквы', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', ' Hund', 3, 8, 2),
(16, 'Заглавные буквы', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Toujours', 3, 8, 2),
(17, 'Регулярные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'arbeiten', 4, 9, 2),
(18, 'Регулярные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'entdecken', 4, 10, 2),
(19, 'Регулярные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'essen', 4, 10, 2),
(20, 'Регулярные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'bleiben', 4, 10, 2),
(21, 'Неопределенный артикль', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'a', 1, 11, 6),
(22, 'Неопределенный артикль', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'a', 1, 11, 6),
(23, 'Использование заглавных букв', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'An', 1, 11, 6),
(24, 'Использование заглавных букв', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', '', 1, 12, 6),
(25, 'Использование заглавных букв', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'The', 1, 12, 6),
(26, 'Использование заглавных букв', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'the', 1, 12, 6),
(27, 'Регулярные глаголы', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Toujours', 3, 13, 6),
(28, 'Регулярные глаголы', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'majuscule', 3, 13, 6),
(29, 'Числа', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'ten', 2, 15, 6),
(30, 'Числа', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'forty', 2, 15, 6),
(31, 'Числа', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Twelve', 2, 15, 6),
(32, 'Числа', 'легкий ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Seventeen', 2, 15, 6),
(33, 'Настоящее время: Утвердительная форма', 'сложный ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Sings', 4, 16, 6),
(34, 'Настоящее время: Утвердительная форма', 'сложный ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Play', 4, 16, 6),
(35, 'Настоящее время: Отрицательная форма', 'сложный ', 'нет доступного перевода на данный момент', 'Does not speak (doesn\'t)', 'Does not', 4, 17, 6),
(36, 'Настоящее время: Отрицательная форма', 'сложный ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Does not like', 4, 17, 6),
(37, 'Настоящее время: Вопросительная форма', 'средний ', 'нет доступного перевода на данный момент', 'нет доступного перевода на данный момент', 'Do', 4, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `global_category_de`
--

CREATE TABLE `global_category_de` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_de`
--

INSERT INTO `global_category_de` (`id`, `name`) VALUES
(1, 'Grammatik'),
(2, 'Wortschatz'),
(3, 'Rechtschreibung'),
(4, 'Konjugation');

-- --------------------------------------------------------

--
-- Structure de la table `global_category_en`
--

CREATE TABLE `global_category_en` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_en`
--

INSERT INTO `global_category_en` (`id`, `name`) VALUES
(1, 'Grammar'),
(2, 'Vocabulary'),
(3, 'Spelling'),
(4, 'Conjugation');

-- --------------------------------------------------------

--
-- Structure de la table `global_category_es`
--

CREATE TABLE `global_category_es` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_es`
--

INSERT INTO `global_category_es` (`id`, `name`) VALUES
(1, 'Gramática'),
(2, 'Vocabulario'),
(3, 'Ortografía'),
(4, 'Conjugación');

-- --------------------------------------------------------

--
-- Structure de la table `global_category_fr`
--

CREATE TABLE `global_category_fr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_fr`
--

INSERT INTO `global_category_fr` (`id`, `name`) VALUES
(1, 'Grammaire'),
(2, 'Vocabulaire'),
(3, 'Orthographe'),
(4, 'Conjugaison ');

-- --------------------------------------------------------

--
-- Structure de la table `global_category_it`
--

CREATE TABLE `global_category_it` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_it`
--

INSERT INTO `global_category_it` (`id`, `name`) VALUES
(1, 'Grammatica'),
(2, 'Lessico'),
(3, 'Ortografia'),
(4, 'Coniugazione');

-- --------------------------------------------------------

--
-- Structure de la table `global_category_ru`
--

CREATE TABLE `global_category_ru` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `global_category_ru`
--

INSERT INTO `global_category_ru` (`id`, `name`) VALUES
(1, 'Грамматика'),
(2, 'Словарный запас'),
(3, 'Орфография'),
(4, 'Спряжение');

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'français', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'allemand', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'italien', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'espagnol', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'russe', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'anglais', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_de`
--

CREATE TABLE `languages_de` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_de`
--

INSERT INTO `languages_de` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'Französisch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'Deutsch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'Italienisch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'Spanisch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'Russisch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'Englisch', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_en`
--

CREATE TABLE `languages_en` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_en`
--

INSERT INTO `languages_en` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'French', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'German', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'Italian', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'Spanish', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'Russian', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'English', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_es`
--

CREATE TABLE `languages_es` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_es`
--

INSERT INTO `languages_es` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'Francés', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'Alemán', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'Italiano', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'Español', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'Ruso', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'Inglés', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_fr`
--

CREATE TABLE `languages_fr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_fr`
--

INSERT INTO `languages_fr` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'français', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'allemand', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'italien', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'espagnol', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'russe', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'anglais', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_it`
--

CREATE TABLE `languages_it` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_it`
--

INSERT INTO `languages_it` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'Francese', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'Tedesco', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'Italiano', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'Spagnolo', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'Russo', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'Inglese', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `languages_ru`
--

CREATE TABLE `languages_ru` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `drapeau` varchar(511) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `languages_ru`
--

INSERT INTO `languages_ru` (`id`, `name`, `drapeau`, `code`) VALUES
(1, 'Французский', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/france.png', 'fr'),
(2, 'Немецкий язык', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/allemagne.png', 'de'),
(3, 'Итальянский', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/italie.png', 'it'),
(4, 'Испанский', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/espagne.png', 'es'),
(5, 'Русский', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/russie.png', 'ru'),
(6, 'Английский язык', 'http://localhost/projet_soutenance_lanly/projet_soutenance_lanly/assets/images/usa.png', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_de`
--

CREATE TABLE `reasons_de` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_de`
--

INSERT INTO `reasons_de` (`id`, `name`) VALUES
(1, 'Reisen'),
(2, 'Arbeit'),
(3, 'Studium'),
(4, 'Kultur'),
(5, 'Kommunikation'),
(6, 'Liebe');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_en`
--

CREATE TABLE `reasons_en` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_en`
--

INSERT INTO `reasons_en` (`id`, `name`) VALUES
(1, 'Travel'),
(2, 'Work'),
(3, 'Studies'),
(4, 'Culture'),
(5, 'Communication'),
(6, 'Love');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_es`
--

CREATE TABLE `reasons_es` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_es`
--

INSERT INTO `reasons_es` (`id`, `name`) VALUES
(1, 'Viajes'),
(2, 'Trabajo'),
(3, 'Estudios'),
(4, 'Cultura'),
(5, 'Comunicación'),
(6, 'Amor');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_fr`
--

CREATE TABLE `reasons_fr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_fr`
--

INSERT INTO `reasons_fr` (`id`, `name`) VALUES
(1, 'voyages'),
(2, 'travail'),
(3, 'etudes'),
(4, 'culture'),
(5, 'communication'),
(6, 'amour');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_it`
--

CREATE TABLE `reasons_it` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_it`
--

INSERT INTO `reasons_it` (`id`, `name`) VALUES
(1, 'Viaggi'),
(2, 'Lavoro'),
(3, 'Studio'),
(4, 'Cultura'),
(5, 'Comunicazione'),
(6, 'Amore');

-- --------------------------------------------------------

--
-- Structure de la table `reasons_ru`
--

CREATE TABLE `reasons_ru` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `reasons_ru`
--

INSERT INTO `reasons_ru` (`id`, `name`) VALUES
(1, 'Путешествия'),
(2, 'Работа'),
(3, 'Обучение'),
(4, 'Культура'),
(5, 'Общение'),
(6, 'Любовь');

-- --------------------------------------------------------

--
-- Structure de la table `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `responses`
--

INSERT INTO `responses` (`id`, `content`, `user_id`, `course_id`, `exercice_id`) VALUES
(1, 'a', 15, 11, 21),
(2, 'a', 15, 11, 22),
(3, 'an', 15, 11, 23),
(4, '', 15, 12, 24),
(5, 'The', 15, 12, 25),
(6, 'the', 15, 12, 26),
(7, 'ef', 15, 1, 1),
(8, 'fe', 15, 1, 2),
(9, 'fe', 15, 1, 3),
(10, 'zfE', 15, 1, 4),
(11, 'ZFE', 15, 1, 5),
(12, 'hallo', 15, 2, 6),
(13, 'auf wiedersehen', 15, 2, 7),
(14, 'tschuss', 15, 2, 8),
(15, 'drei', 15, 2, 9),
(16, 'sieben', 15, 2, 10),
(17, 'wednesday', 15, 2, 11),
(18, 'sonntag', 15, 2, 12),
(19, 'toujours', 15, 13, 27),
(20, 'majuscule', 15, 13, 28),
(21, 'de', 19, 1, 1),
(22, 'die', 19, 1, 2),
(23, 'ein', 19, 1, 3),
(24, 'die', 19, 1, 4),
(25, 'das', 19, 1, 5),
(26, 'hallo', 19, 2, 6),
(27, '', 19, 2, 7),
(28, '', 19, 2, 8),
(29, '', 19, 2, 9),
(30, '', 19, 2, 10),
(31, '', 19, 2, 11),
(32, '', 19, 2, 12);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `picture` varchar(511) NOT NULL,
  `role` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `country_id`, `language_id`, `picture`, `role`, `date`) VALUES
(15, 'a', 'a@a.fr', '$2y$10$snjRHs.Eo4Dw6xra4KPuLe3vE6.UZIXzQZdYwYKhCT6csPaVheJra', 1, 2, './uploads/spanish.png', 'ADMIN', '2024-03-06'),
(16, 'elo', 'elo@elo.fr', '$2y$10$5X1MSuURhUXxCvNQ6xRccOM7HiDoa9Z5TiLXNOO17u05mPSfNQe7W', 2, 4, '', 'USER', '2024-03-22'),
(17, 'test', 'test@test.fr', '$2y$10$iMIbKhO6XcA7TmCZjkbap.qmBOF3ZzPgNkcVnDWGP959auhBPwNwW', 1, 4, 'none', 'USER', '2024-03-27'),
(18, 'test', 'test@test.fr', '$2y$10$BFmdtmPtRrLDKTf9BKmcGe/t5T7YRU8yUrgjohfDO/1Kya0BjtStm', 2, 2, 'none', 'USER', '2024-03-27'),
(19, 'lolo', 'lolo@lolo.fr', '$2y$10$F7SLmrHW4W8.09E4Y7vKXuZgql5sr/T/GUxMsyMvSuxE8tKUldxT6', 2, 2, './uploads/terre_full.png', 'USER', '2024-03-28');

-- --------------------------------------------------------

--
-- Structure de la table `users_courses`
--

CREATE TABLE `users_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `finished` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users_courses`
--

INSERT INTO `users_courses` (`id`, `user_id`, `course_id`, `locked`, `finished`) VALUES
(1, 15, 1, 1, 1),
(2, 15, 2, 0, 1),
(3, 15, 3, 0, 0),
(4, 15, 4, 1, 0),
(5, 15, 5, 1, 0),
(6, 15, 6, 1, 0),
(7, 15, 7, 1, 0),
(8, 15, 8, 1, 0),
(9, 15, 9, 1, 0),
(10, 15, 10, 1, 0),
(11, 15, 11, 1, 1),
(12, 15, 12, 0, 1),
(13, 15, 13, 0, 1),
(14, 15, 14, 0, 0),
(15, 15, 15, 1, 0),
(16, 15, 16, 1, 0),
(17, 15, 17, 1, 0),
(18, 15, 18, 1, 0),
(19, 19, 1, 1, 1),
(20, 19, 2, 0, 1),
(21, 19, 3, 0, 0),
(22, 19, 4, 1, 0),
(23, 19, 5, 1, 0),
(24, 19, 6, 1, 0),
(25, 19, 7, 1, 0),
(26, 19, 8, 1, 0),
(27, 19, 9, 1, 0),
(28, 19, 10, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users_reasons`
--

CREATE TABLE `users_reasons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users_reasons`
--

INSERT INTO `users_reasons` (`id`, `user_id`, `reason_id`) VALUES
(1, 16, 1),
(2, 17, 1),
(3, 17, 2),
(4, 19, 1),
(5, 19, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contries_de`
--
ALTER TABLE `contries_de`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `contries_en`
--
ALTER TABLE `contries_en`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `contries_es`
--
ALTER TABLE `contries_es`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `contries_fr`
--
ALTER TABLE `contries_fr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `contries_it`
--
ALTER TABLE `contries_it`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `contries_ru`
--
ALTER TABLE `contries_ru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `courses_de`
--
ALTER TABLE `courses_de`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `courses_en`
--
ALTER TABLE `courses_en`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `courses_es`
--
ALTER TABLE `courses_es`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `courses_fr`
--
ALTER TABLE `courses_fr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `courses_it`
--
ALTER TABLE `courses_it`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `courses_ru`
--
ALTER TABLE `courses_ru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `examples_de`
--
ALTER TABLE `examples_de`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Index pour la table `examples_en`
--
ALTER TABLE `examples_en`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Index pour la table `examples_es`
--
ALTER TABLE `examples_es`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `examples_fr`
--
ALTER TABLE `examples_fr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examples_ibfk_1` (`course_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `examples_it`
--
ALTER TABLE `examples_it`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `examples_ru`
--
ALTER TABLE `examples_ru`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices_de`
--
ALTER TABLE `exercices_de`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices_en`
--
ALTER TABLE `exercices_en`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices_es`
--
ALTER TABLE `exercices_es`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices_fr`
--
ALTER TABLE `exercices_fr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_category_id` (`global_category_id`),
  ADD KEY `exercices_ibfk_3` (`course_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `exercices_it`
--
ALTER TABLE `exercices_it`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices_reasons`
--
ALTER TABLE `exercices_reasons`
  ADD KEY `exercice_id` (`exercice_id`),
  ADD KEY `reason_id` (`reason_id`);

--
-- Index pour la table `exercices_ru`
--
ALTER TABLE `exercices_ru`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_de`
--
ALTER TABLE `global_category_de`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_en`
--
ALTER TABLE `global_category_en`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_es`
--
ALTER TABLE `global_category_es`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_fr`
--
ALTER TABLE `global_category_fr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_it`
--
ALTER TABLE `global_category_it`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `global_category_ru`
--
ALTER TABLE `global_category_ru`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_de`
--
ALTER TABLE `languages_de`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_en`
--
ALTER TABLE `languages_en`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_es`
--
ALTER TABLE `languages_es`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_fr`
--
ALTER TABLE `languages_fr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_it`
--
ALTER TABLE `languages_it`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages_ru`
--
ALTER TABLE `languages_ru`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_de`
--
ALTER TABLE `reasons_de`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_en`
--
ALTER TABLE `reasons_en`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_es`
--
ALTER TABLE `reasons_es`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_fr`
--
ALTER TABLE `reasons_fr`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_it`
--
ALTER TABLE `reasons_it`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reasons_ru`
--
ALTER TABLE `reasons_ru`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercice_id` (`exercice_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `users_courses`
--
ALTER TABLE `users_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `users_courses_ibfk_1` (`course_id`);

--
-- Index pour la table `users_reasons`
--
ALTER TABLE `users_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reason_id` (`reason_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contries_de`
--
ALTER TABLE `contries_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contries_en`
--
ALTER TABLE `contries_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contries_es`
--
ALTER TABLE `contries_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contries_fr`
--
ALTER TABLE `contries_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contries_it`
--
ALTER TABLE `contries_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contries_ru`
--
ALTER TABLE `contries_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `courses_de`
--
ALTER TABLE `courses_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `courses_en`
--
ALTER TABLE `courses_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `courses_es`
--
ALTER TABLE `courses_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `courses_fr`
--
ALTER TABLE `courses_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `courses_it`
--
ALTER TABLE `courses_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `courses_ru`
--
ALTER TABLE `courses_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `examples_de`
--
ALTER TABLE `examples_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `examples_en`
--
ALTER TABLE `examples_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `examples_es`
--
ALTER TABLE `examples_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `examples_fr`
--
ALTER TABLE `examples_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `examples_it`
--
ALTER TABLE `examples_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `examples_ru`
--
ALTER TABLE `examples_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `exercices_de`
--
ALTER TABLE `exercices_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `exercices_en`
--
ALTER TABLE `exercices_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `exercices_es`
--
ALTER TABLE `exercices_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `exercices_fr`
--
ALTER TABLE `exercices_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `exercices_it`
--
ALTER TABLE `exercices_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `exercices_ru`
--
ALTER TABLE `exercices_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `global_category_de`
--
ALTER TABLE `global_category_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `global_category_en`
--
ALTER TABLE `global_category_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `global_category_es`
--
ALTER TABLE `global_category_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `global_category_fr`
--
ALTER TABLE `global_category_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `global_category_it`
--
ALTER TABLE `global_category_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `global_category_ru`
--
ALTER TABLE `global_category_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `languages_de`
--
ALTER TABLE `languages_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages_en`
--
ALTER TABLE `languages_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages_es`
--
ALTER TABLE `languages_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages_fr`
--
ALTER TABLE `languages_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages_it`
--
ALTER TABLE `languages_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `languages_ru`
--
ALTER TABLE `languages_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reasons_de`
--
ALTER TABLE `reasons_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reasons_en`
--
ALTER TABLE `reasons_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reasons_es`
--
ALTER TABLE `reasons_es`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reasons_fr`
--
ALTER TABLE `reasons_fr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reasons_it`
--
ALTER TABLE `reasons_it`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reasons_ru`
--
ALTER TABLE `reasons_ru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `users_reasons`
--
ALTER TABLE `users_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contries_de`
--
ALTER TABLE `contries_de`
  ADD CONSTRAINT `contries_de_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `contries_en`
--
ALTER TABLE `contries_en`
  ADD CONSTRAINT `contries_en_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `contries_es`
--
ALTER TABLE `contries_es`
  ADD CONSTRAINT `contries_es_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `contries_fr`
--
ALTER TABLE `contries_fr`
  ADD CONSTRAINT `contries_fr_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `contries_it`
--
ALTER TABLE `contries_it`
  ADD CONSTRAINT `contries_it_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `contries_ru`
--
ALTER TABLE `contries_ru`
  ADD CONSTRAINT `contries_ru_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `courses_de`
--
ALTER TABLE `courses_de`
  ADD CONSTRAINT `courses_de_ibfk_1` FOREIGN KEY (`global_category_id`) REFERENCES `global_category_de` (`id`),
  ADD CONSTRAINT `courses_de_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `courses_en`
--
ALTER TABLE `courses_en`
  ADD CONSTRAINT `courses_en_ibfk_1` FOREIGN KEY (`global_category_id`) REFERENCES `global_category_en` (`id`),
  ADD CONSTRAINT `courses_en_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `courses_es`
--
ALTER TABLE `courses_es`
  ADD CONSTRAINT `courses_es_ibfk_1` FOREIGN KEY (`global_category_id`) REFERENCES `global_category_es` (`id`),
  ADD CONSTRAINT `courses_es_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `courses_it`
--
ALTER TABLE `courses_it`
  ADD CONSTRAINT `courses_it_ibfk_1` FOREIGN KEY (`global_category_id`) REFERENCES `global_category_it` (`id`),
  ADD CONSTRAINT `courses_it_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `courses_ru`
--
ALTER TABLE `courses_ru`
  ADD CONSTRAINT `courses_ru_ibfk_1` FOREIGN KEY (`global_category_id`) REFERENCES `global_category_ru` (`id`),
  ADD CONSTRAINT `courses_ru_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `examples_de`
--
ALTER TABLE `examples_de`
  ADD CONSTRAINT `examples_de_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `examples_de_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses_de` (`id`);

--
-- Contraintes pour la table `examples_en`
--
ALTER TABLE `examples_en`
  ADD CONSTRAINT `examples_en_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages_en` (`id`),
  ADD CONSTRAINT `examples_en_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses_en` (`id`);

--
-- Contraintes pour la table `examples_fr`
--
ALTER TABLE `examples_fr`
  ADD CONSTRAINT `examples_fr_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `exercices_fr`
--
ALTER TABLE `exercices_fr`
  ADD CONSTRAINT `exercices_fr_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Contraintes pour la table `exercices_reasons`
--
ALTER TABLE `exercices_reasons`
  ADD CONSTRAINT `exercices_reasons_ibfk_1` FOREIGN KEY (`exercice_id`) REFERENCES `exercices_fr` (`id`),
  ADD CONSTRAINT `exercices_reasons_ibfk_2` FOREIGN KEY (`reason_id`) REFERENCES `reasons_fr` (`id`);

--
-- Contraintes pour la table `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `users_courses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users_reasons`
--
ALTER TABLE `users_reasons`
  ADD CONSTRAINT `users_reasons_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `reasons_fr` (`id`),
  ADD CONSTRAINT `users_reasons_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;