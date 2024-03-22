<?php

class AuthController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("auth", $lang);
    }

    public function getTranslator(): Translator
    {
        return $this->translator;
    }

    public function login(): void
    {

        //Réinitialisation des sessions de messages d'erreur lors de l'inscription ou la connexion
        $_SESSION['erreur_hash'] = '';
        $_SESSION['erreur_mail'] = '';
        $_SESSION['erreur_remplissage'] = '';



        $this->render("auth/login.html.twig", []);
    }

    public function register(): void
    {

        //Récupération de tous les langages pour les affichés dans le formulaire d'inscription
        $lm = new LanguageManager();
        $rm = new ReasonManager();


        $reasons = $rm->getAllReasons();
        $languages = $lm->getAllLanguages();






        //Réinitialisation des sessions de messages d'erreur lors de l'inscription ou la connexion
        $_SESSION['erreur_hash'] = '';
        $_SESSION['erreur_mail'] = '';
        $_SESSION['erreur_remplissage'] = '';


        $this->render("auth/register.html.twig", ['languages' => $languages, 'reasons' => $reasons]);
    }


    public function checkLogin(): void
    {

        $userManager = new UserManager();
        $tokenManager = new CSRFTokenManager();


        //Validation du token avant toute chose pour empêcher les faille CSRF
        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {

            //Sécurisation des données reçu par le biais du formulaire d'authentification
            if (!empty($_POST['email']) && !empty($_POST['password'])) {
                $email = htmlspecialchars($_POST['email']);
                $password = htmlspecialchars($_POST['password']);

                //Récuperation de l'utilisateur par son EMAIL
                $user = $userManager->getUserByEmail($email);



                //Si l'utilisateur est présent et que son mot de passe est le bon, il se verra connecté
                if ($user) {

                    if ($_SESSION['connexion'] === 'autorise' && password_verify($password, $user->getPassword())) {
                        $_SESSION['role'] = $user->getRole();
                        $_SESSION['user_email'] = $user->getEmail();
                        $_SESSION['user_id'] = $user->getId();
                        $_SESSION['user_language'] = $user->getLanguage()->getId();

                        $_SESSION['user_lang'] = $user->getCountry()->getLanguage()->getCode();



                        $rm = new ReasonManager();




                        //Ajout de l'url du drapeau dans la session afin de l'afficher dans le header pour savoir quelle langue l'utilisateur est en train d'apprendre
                        $lm = new LanguageManager();
                        $language = $lm->getOneLanguageById($_SESSION['user_language']);
                        $_SESSION['selected_language'] = $language->getDrapeau();


                        //Création d'un objet composé du nom de la langue et de son id qui permettrons, dans un menu dropdown, de changer de langue d'apprentissage
                        $languages = $lm->getAllLanguages();
                        $language_array = [];

                        //creation d'un objet STDclass qui permettra d'afficher les langues avec leurs ID associé dans un dropdown du header
                        foreach ($languages as $language) {
                            $language_object = new stdClass();
                            $language_object->language_name = $language->getName();
                            $language_object->language_id = $language->getId();
                            $language_array[] = $language_object;
                        }

                        $_SESSION['connexion_layout'] = 'autorise';

                        //Initialisation de la session avec l'objet précédemment créé
                        $_SESSION['languages'] = $language_array;

                        $this->redirect("index.php?route=login_home");
                    } else {
                        $_SESSION['erreur_hash'] = 'Le mot de passe est incorrect';
                        $this->redirect("index.php?route=login");
                    }
                } else {
                    $_SESSION['erreur_mail'] = 'Cette adresse mail n\'a pas été trouvé';
                    $this->redirect("index.php?route=login");
                }
            } else {
                $_SESSION['erreur_remplissage'] = 'Vous devez remplir toutes les informations';
                $this->redirect("index.php?route=login");
            }
        }
    }


    public function checkRegister(): void
    {

        $userManager = new UserManager();
        $countryManager = new CountryManager();
        $tokenManager = new CSRFTokenManager();
        $languageManager =  new LanguageManager();
        $rm = new ReasonManager();
        $passwordRegex = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-_+=])[A-Za-z\d!@#$%^&*()-_+=]{8,}$/';;

        //Vaalidation du token avant toute chose pour empêcher les faille CSRF
        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {


            //Sécurisation des données reçu par le biais du formulaire d'authentification avec le HTMLSPECIALCHARS
            if (!empty($_POST['username']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirmPassword']) && !empty($_POST['country']) && !empty($_POST['language'])) {

                //Sécurisation du mot de passe avec la RegEx
                if (preg_match($passwordRegex, $_POST['password'])) {
                    $password = htmlspecialchars(password_hash($_POST['password'], PASSWORD_DEFAULT));
                } else {
                    $_SESSION['erreur_regex'] = 'Le mot de passe doit contenir au moins une lettre majuscule ou minuscule, un chiffre, un caractère spécial et doit faire au moins 8 caractères';
                    $this->redirect("index.php?route=register");
                }


                //Initialisation des variables
                $username = htmlspecialchars($_POST['username']);
                $email = htmlspecialchars($_POST['email']);
                $confirmPassword = htmlspecialchars($_POST['confirmPassword']);
                $country_data = $_POST['country'];
                $language_data = strtolower($_POST['language']);
                $reasons = $_POST['reasons'];

                //Ajout du tableau 'reason' à la session afin de pouvoir les ajouter à la table de liaison 'users_reasons'
                $_SESSION['reasons'] = $reasons;


                //Ajout à la table de liaison des utilisateur et leur raisons d'apprentissage si la raison n'existe pas déjà



                //vérification que les deux mots de passe sont bien identique
                if ($confirmPassword === $_POST['password']) {

                    $country = $countryManager->getOneCountryByName($country_data);
                    $language = $languageManager->getOneLanguageByName($language_data);


                    //Création d'un nouvel utilisateur et insertion en base de donnée
                    $newUser = new User($username, $email, $password, $country, $language, date('Y-m-d'));
                    $userManager->createUser($newUser);

                    $user = $userManager->getUserByEmail($email);

                    foreach ($_SESSION['reasons'] as $reason_data) {
                        $reason = $rm->getReasonByName($reason_data);
                        $existingReasons = $rm->getUserReasons($user->getId(), $reason->getId());
                        if (!$existingReasons) {
                            $rm->addUserReason($user->getId(), $reason->getId());
                        }
                    }

                    $_SESSION['role'] = $user->getRole();

                    $this->redirect("index.php?route=login");
                } else {
                    $_SESSION['erreur_mdp'] = 'Les mots de passe ne sont pas indentiques';
                    $this->redirect("index.php?route=register");
                }
            } else {
                $_SESSION['erreur_remplissage'] = 'Vous devez remplir toutes les informations';
                $this->redirect("index.php?route=register");
            }
        } else {
            $_SESSION['erreur_csrf'] = 'Erreur de sécurité CSRF';
            $this->redirect("index.php?route=register");
        }
    }


    public function logout(): void
    {
        //destruction de la session afin de déconnécter l'utilisateur
        session_destroy();
        $this->redirect("index.php?route=login");
    }

    // public function switchLang(): void
    // {
    //     $_SESSION['user_lang'] = $_SESSION["lang"];
    // }
}
