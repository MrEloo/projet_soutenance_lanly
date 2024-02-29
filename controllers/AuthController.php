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

        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {

            if (!empty($_POST['email']) && !empty($_POST['password'])) {
                $email = $_POST['email'];
                $password = $_POST['password'];

                $user = $userManager->getUserByEmail($email);



                if ($user) {

                    if ($_SESSION['connexion'] === 'autorise' && password_verify($password, $user->getPassword())) {
                        $_SESSION['role'] = $user->getRole();
                        $_SESSION['user_email'] = $user->getEmail();
                        $this->redirect("index.php?route=login_home", []);
                    } else {
                        $_SESSION['erreur_hash'] = 'Le mot de passe est incorrect';
                        echo $_SESSION['erreur_hash'];
                    }
                } else {
                    $_SESSION['erreur_mail'] = 'votre adresse mail est incorrect';
                    echo $_SESSION['erreur_mail'];
                }
            } else {
                $_SESSION['erreur_remplissage'] = 'Vous devez remplir toutes les informations';
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

        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {



            if (!empty($_POST['username']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirmPassword']) && !empty($_POST['country']) && !empty($_POST['language']) && !empty($_POST['reasons'])) {
                $username = $_POST['username'];
                $email = $_POST['email'];
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                $confirmPassword = $_POST['confirmPassword'];
                $country_data = $_POST['country'];
                $language_data = $_POST['language'];





                if ($confirmPassword === $_POST['password']) {
                    $_SESSION['connexion'] = 'autorisé';
                    $country = $countryManager->getOneCountryByName($country_data);
                    $language = $languageManager->getOneLanguageByName($language_data);



                    $newUser = new User($username, $email, $password, $country, $language, date('Y-m-d'));
                    $this->redirect('index.php?route=login');
                    $userManager->createUser($newUser);
                } else {
                    $_SESSION['erreur_mdp'] = 'Les mots de passe ne sont pas indentiques';
                    $this->redirect('index.php?route=register');
                }
            } else {
                $_SESSION['erreur_remplissage'] = 'Vous devez remplir toutes les informations';
                $this->redirect('index.php?route=register');
            }
        } else {
            $_SESSION['erreur_csrf'] = 'Erreur de sécurité CSRF';
            $this->redirect('index.php?route=register');
        }
    }


    public function logout(): void
    {
        session_destroy();
        $this->redirect('index.php?route=login');
    }
}
