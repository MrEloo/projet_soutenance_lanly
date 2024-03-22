<?php


class LanguageController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("language", $lang);
    }

    //suppression d'une langue en base de données
    public function deleteLanguage(): void
    {
        if ($this->isUserOrAdmin()) {
            $lm = new LanguageManager();
            $lm->deleteLanguage($_GET['lan_id']);
            $this->redirect("index.php?route=allLanguages");
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'édition d'une langue
    public function languageForm(): void
    {
        if ($this->isUserOrAdmin()) {
            $this->render("admin/update/update-language.html.twig", ['lan_id' => $_GET['lan_id']]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'ajout d'une langue
    public function languageFormAdd(): void
    {
        if ($this->isUserOrAdmin()) {
            $this->render("admin/add/add-language.html.twig", []);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }


    public function addLanguage(): void
    {
        if ($this->isUserOrAdmin()) {
            if (isset($_POST['language_name']) && isset($_POST['flag_url'])) {

                //initalisation des managers
                $lm = new LanguageManager();

                //sécurisation des donnés + insertion en base de donnée
                $lm->addLanguage(htmlspecialchars($_POST['language_name']), htmlspecialchars($_POST['flag_url']));
                $this->redirect("index.php?route=allLanguages");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function changeLanguage(): void
    {
        if ($this->isUserOrAdmin()) {

            //Modification de la session de la langue choisi par l'utilisateur
            $_SESSION['user_language'] = $_GET['lan_id'];

            //initialisation des managers
            $lm = new LanguageManager();

            //Ajout du nouveau drapeau à la session pour modifier le drapeau du header
            $language_flag = $lm->getOneLanguageById($_GET['lan_id']);
            $_SESSION['selected_language'] = $language_flag->getDrapeau();

            $this->redirect("index.php?route=login_home");
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function switchLanguage(): void
    {

        if ($this->isUserOrAdmin()) {
            $_SESSION['user_lang'] = $_GET['lang_code'];
            $this->redirect("index.php?route=login_home");
        } else {
            $_SESSION['user_lang'] = $_GET['lang_code'];


            //Réinitialisation des sessions de messages d'erreur lors de l'inscription ou la connexion
            $_SESSION['erreur_hash'] = '';
            $_SESSION['erreur_mail'] = '';
            $_SESSION['erreur_remplissage'] = '';
            $this->redirect("index.php");
        }
    }
}
