<?php

class ResponseController extends AbstractController
{
    //Enregistre les données de l'utilisateur en base de données et les remplaces si déjà existantes
    public function checkResponse()
    {
        $tokenManager = new CSRFTokenManager();

        if ($tokenManager->validateCSRFToken($_SESSION['csrf_token'])) {

            $em = new ExerciceManager();
            $rm = new ResponseManager();
            $cm = new CourseManager();

            
            $exercices = $em->getAllExercicesByCourse($_GET['course_id']);
            foreach ($exercices as $key => $exercice) {
                $existingResponses  = $rm->getResponseByExId($exercice->getId(), $_SESSION['user_id']);
                if (!$existingResponses) {
                    if (isset($_POST['response']) && $_POST['response'] === 'ok') {
                        $responses = json_decode($_POST['answers']);
                        //Enregistrement en base de donnée, débloquage de l'exerice du cours suivant et considéré comme 'fini'
                        $rm->createResponse($responses[$key]->response, $_SESSION['user_id'], $responses[$key]->course_id, $exercice->getId());
                        $cm->unlockCourse($_SESSION['user_id'], $responses[$key]->course_id + 1);
                        $cm->isFinished($_SESSION['user_id'], $responses[$key]->course_id);
                    }
                } else {
                    //update des infos de la base de données pour pouvoir refaire les exercices
                    $responses = json_decode($_POST['answers']);
                    $rm->updateResponse($existingResponses->getId(), $responses[$key]->response, $_SESSION['user_id'], $responses[$key]->course_id, $exercice->getId());
                }
            }
            echo json_encode(['status' => 'ok']);
        }
    }

    public function showExRes(): void
    {
        //Affiche la page de correction + le résultat associé de l'utilisateur
        if ($this->isUserOrAdmin()) {
            $em = new ExerciceManager();
            $rm = new ResponseManager();
            $exercices = $em->getAllExercicesByCourse($_GET['course_id']);


            foreach ($exercices as $exercice) {
                $reponses = $rm->getResponseByExId($exercice->getId(), $_SESSION['user_id']);
                $exercice->setResponse($reponses);
            }


            $result = 0;

            foreach ($exercices as $exercice) {
                $reponse = strtolower($exercice->getResponse()->getContent());
                $correction = strtolower($exercice->getCorrection());

                if ($reponse === $correction) {
                    $result += 1;
                }
            }


            $this->render('ex-res.html.twig', ['exercices' => $exercices, 'result' => $result]);
        } else {
            $this->render("home.html.twig", []);
        }
    }
}
