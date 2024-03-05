<?php

class AuthController extends AbstractController
{
    public function login(): void
    {
        $this->render("login.html.twig", []);
    }

    public function register(): void
    {
        $this->render("register.html.twig", []);
    }


    public function checkLogin(): void
    {
        $userManager = new UserManager();
        $tokenManager = new CSRFTokenManager();

        //Vaalidation du token avant toute chose pour empêcher les faille CSRF
        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {

            //Sécurisation des données reçu par le biais du formulaire d'authentification
            if (!empty($_POST['email']) && !empty($_POST['password'])) {
                $email = htmlspecialchars($_POST['email']);
                $password = htmlspecialchars($_POST['password']);

                $user = $userManager->getUserByEmail($email);


                //Si l'utilisateur est présent et que son mot de passe est le bon, il se verra connecté
                if ($user) {

                    if ($_SESSION['connexion'] === 'autorise' && password_verify($password, $user->getPassword())) {
                        $_SESSION['role'] = $user->getRole();
                        $_SESSION['user_email'] = $user->getEmail();
                        $_SESSION['user_id'] = $user->getId();
                        $this->redirect("index.php?route=login_home");
                    } else {
                        $_SESSION['erreur_hash'] = 'Le mot de passe est incorrect';
                        $this->redirect("index.php?route=login");
                        echo $_SESSION['erreur_hash'];
                    }
                } else {
                    $_SESSION['erreur_mail'] = 'votre adresse mail est incorrect';
                    $this->redirect("index.php?route=login");
                    echo $_SESSION['erreur_mail'];
                }
            } else {
                $_SESSION['erreur_remplissage'] = 'Vous devez remplir toutes les informations';
                $this->redirect("index.php?route=login");
                echo $_SESSION['erreur_remplissage'];
            }
        }
    }



    public function checkRegister(): void
    {
        $userManager = new UserManager();
        $countryManager = new CountryManager();
        $tokenManager = new CSRFTokenManager();
        $languageManager =  new LanguageManager();

        //Vaalidation du token avant toute chose pour empêcher les faille CSRF
        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {


            //Sécurisation des données reçu par le biais du formulaire d'authentification avec le HTMLSPECIALCHARS
            if (!empty($_POST['username']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirmPassword']) && !empty($_POST['country']) && !empty($_POST['language']) && !empty($_POST['reasons'])) {
                $username = htmlspecialchars($_POST['username']);
                $email = htmlspecialchars($_POST['email']);
                $password = htmlspecialchars(password_hash($_POST['password'], PASSWORD_DEFAULT));
                $confirmPassword = htmlspecialchars($_POST['confirmPassword']);
                $country_data = $_POST['country'];
                $language_data = $_POST['language'];




                if ($confirmPassword === $_POST['password']) {

                    $_SESSION['connexion'] = 'autorisé';
                    $country = $countryManager->getOneCountryByName($country_data);
                    $language = $languageManager->getOneLanguageByName($language_data);



                    $newUser = new User($username, $email, $password, $country, $language, date('Y-m-d'));
                    $userManager->createUser($newUser);
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
        session_destroy();
        $this->redirect("index.php?route=login");
    }
}
