<?php

class ResponseController extends AbstractController
{
    //Enregistre les données de l'utilisateur en base de données et les remplaces si déjà existantes
    public function checkResponse()
    {
        $tokenManager = new CSRFTokenManager();

        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {


            //Initialisation des managers
            $em = new ExerciceManager();
            $rm = new ResponseManager();
            $cm = new CourseManager();

            //Récuperation de toutes les QUESTIONS d'un cours
            $exercices = $em->getAllExercicesByCourse($_GET['course_id'], $_SESSION['user_language']);


            foreach ($exercices as $key => $exercice) {



                //Pour chaque question, on regarde si une réponse existe déjà dans la table users_responses
                $existingResponses  = $rm->getResponseByExId($exercice->getId(), $_SESSION['user_id']);

                //si non :
                if (!$existingResponses) {
                    if (isset($_POST['response']) && $_POST['response'] === 'ok') {
                        $responses = json_decode($_POST['answers']);
                        //Création de la réponse dans la table
                        $rm->createResponse($responses[$key]->response, $_SESSION['user_id'], $responses[$key]->course_id, $exercice->getId());
                        //Déblocage du cours suivant
                        $cm->unlockCourse($_SESSION['user_id'], $responses[$key]->course_id + 1);
                        //Signalement que l'exercice est terminé
                        $cm->isFinished($_SESSION['user_id'], $responses[$key]->course_id);
                    }
                } else {
                    //si oui :
                    //update des infos de la base de données pour pouvoir refaire les exercices
                    $responses = json_decode($_POST['answers']);
                    $rm->updateResponse($existingResponses->getId(), $responses[$key]->response, $_SESSION['user_id'], $responses[$key]->course_id, $exercice->getId());
                }
            }
            echo json_encode(['status' => 'ok']);
        }
    }

    //Affiche la page de correction + le résultat associé de l'utilisateur
    public function showExRes(): void
    {

        if ($this->isUserOrAdmin()) {

            //initialisation des managers
            $em = new ExerciceManager();
            $rm = new ResponseManager();

            //Récupération de toutes les questions du cours
            $exercices = $em->getAllExercicesByCourse($_GET['course_id'], $_SESSION['user_language']);

            //attribution des réponse de l'utilisateur au modèle
            foreach ($exercices as $exercice) {
                $reponses = $rm->getResponseByExId($exercice->getId(), $_SESSION['user_id']);
                $exercice->setResponse($reponses);
            }


            $result = 0;


            //Logique de comparaison des réponse et de la corréction
            foreach ($exercices as $exercice) {
                $reponse = strtolower($exercice->getResponse()->getContent());
                $correction = strtolower($exercice->getCorrection());

                if ($reponse === $correction) {
                    $result += 1;
                }
            }


            $this->render('exercices/ex-res.html.twig', ['exercices' => $exercices, 'result' => $result]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }
}
