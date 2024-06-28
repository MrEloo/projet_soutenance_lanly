<?php

class ResponseManager extends AbstractManager
{

    public function createResponse(string $content, ?int $user_id, int $course_id, int $exercice_id): void
    {
        $createResponseQuery = $this->db->prepare('INSERT INTO responses (content, user_id, course_id, exercice_id) VALUES (:content, :user_id, :course_id, :exercice_id)');
        $parameters = ['content' => $content, 'user_id' => $user_id, 'course_id' => $course_id, 'exercice_id' => $exercice_id];
        $createResponseQuery->execute($parameters);
    }

    public function getResponseByExId(int $exercice_id, int $user_id): ?Response
    {
        $selectOneResponseByCourseIdQuery = $this->db->prepare('SELECT * FROM responses WHERE exercice_id = :exercice_id AND user_id = :user_id');
        $parameters = ['exercice_id' => $exercice_id, 'user_id' => $user_id];
        $selectOneResponseByCourseIdQuery->execute($parameters);
        $reponse_data = $selectOneResponseByCourseIdQuery->fetch(PDO::FETCH_ASSOC);


        $um = new UserManager();
        $cm = new CourseManager();

        if ($reponse_data) {
            $user = $um->getUserById($reponse_data['user_id']);
            $course = $cm->getCoursesById($reponse_data['course_id'], $_SESSION['user_language']);
            $response = new Response($reponse_data['content'], $user, $course);
            $response->setId($reponse_data['id']);
            return $response;
        } else {
            return null;
        }
    }

    public function updateResponse(int $response_id, string $content, ?int $user_id, int $course_id, int $exercice_id): void
    {
        $updateResponseQuery = $this->db->prepare('UPDATE responses SET content = :content, user_id = :user_id, course_id = :course_id, exercice_id = :exercice_id WHERE id = :response_id');

        $parameters = ['content' => $content, 'user_id' => $user_id, 'course_id' => $course_id, 'exercice_id' => $exercice_id, 'response_id' => $response_id];

        $updateResponseQuery->execute($parameters);
    }
}
