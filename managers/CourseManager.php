<?php


class CourseManager extends AbstractManager
{

    public function verifyLanguage()
    {
        $allowed_languages = ['en', 'fr', 'es', 'ru', 'it', 'de'];
        $user_lang = $_SESSION['user_lang'];

        if (!in_array($user_lang, $allowed_languages, true)) {
            throw new InvalidArgumentException('Langue non autorisée');
        } else {
            return "courses_{$user_lang}";
        }
    }

    public function verifyLanguageId()
    {
        $languageId = $_SESSION['user_language'];

        if (!is_numeric($languageId)) {
            throw new InvalidArgumentException('id non correspondant');
        } else {
            return $languageId;
        }
    }


    public function getCoursesByTheirCat(int $global_category_id, int $language_id): ?array
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByCat = $this->db->prepare("SELECT * FROM $table 
        WHERE $table.global_category_id = :global_category_id AND $table.language_id = :language_id");
        $parameters = ['global_category_id' => $global_category_id, 'language_id' => $language_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);


        $course_array = [];

        if ($courses_data) {
            foreach ($courses_data as $key => $course_data) {
                $gc = new GlobalCategoryManager;
                $global_category = $gc->getOneCatById($course_data['global_category_id']);
                $course = new Course($course_data['title'], $course_data['description'], $global_category);
                $course->setId($course_data['id']);
                // $course->setLocked($course_data['users_courses_locked']);
                $course_array[] = $course;
            }
            return $course_array;
        } else {
            return null;
        }
    }

    public function getCoursesById(int $id, int $language_id): ?Course
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByCat = $this->db->prepare("SELECT * FROM $table WHERE $table.id = :id AND $table.language_id = :language_id");
        $parameters = ['id' => $id, 'language_id' => $language_id];
        $selectAllCoursesByCat->execute($parameters);

        $course_data = $selectAllCoursesByCat->fetch(PDO::FETCH_ASSOC);

        if ($course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);

            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['id']);

            return $course;
        } else {
            return null;
        }
    }

    public function getCoursesByLanguageId(int $language_id): ?array
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByCat = $this->db->prepare("SELECT * FROM $table WHERE  $table.language_id = :language_id");
        $parameters = ['language_id' => $language_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        if ($courses_data) {
            $course_array = [];

            foreach ($courses_data as $key => $course_data) {
                $gc = new GlobalCategoryManager;
                $global_category = $gc->getOneCatById($course_data['global_category_id']);
                $course = new Course($course_data['title'], $course_data['description'], $global_category);
                $course->setId($course_data['id']);
                $course_array[] = $course;
            }
            return $course_array;
        } else {
            return null;
        }
    }


    public function unlockCourse(int $user_id, int $course_id): void
    {
        $updateCourseQuery = $this->db->prepare('UPDATE users_courses SET locked = 0 WHERE user_id = :user_id AND course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $updateCourseQuery->execute($parameters);
    }

    public function isFinished(int $user_id, int $course_id): void
    {
        $updateCourseQuery = $this->db->prepare('UPDATE users_courses SET finished = 1 WHERE user_id = :user_id AND course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $updateCourseQuery->execute($parameters);
    }

    public function deleteCourse(int $id): void
    {
        $deleteCourse_deQuery = $this->db->prepare('DELETE FROM courses_de WHERE id = :id ');
        $deleteCourse_enQuery = $this->db->prepare('DELETE FROM courses_en WHERE id = :id ');
        $deleteCourse_esQuery = $this->db->prepare('DELETE FROM courses_es WHERE id = :id ');
        $deleteCourse_frQuery = $this->db->prepare('DELETE FROM courses_fr WHERE id = :id ');
        $deleteCourse_itQuery = $this->db->prepare('DELETE FROM courses_it WHERE id = :id ');
        $deleteCourse_ruQuery = $this->db->prepare('DELETE FROM courses_ru WHERE id = :id ');

        $parameters = ['id' => $id];

        $deleteCourse_deQuery->execute($parameters);
        $deleteCourse_enQuery->execute($parameters);
        $deleteCourse_esQuery->execute($parameters);
        $deleteCourse_frQuery->execute($parameters);
        $deleteCourse_itQuery->execute($parameters);
        $deleteCourse_ruQuery->execute($parameters);
    }

    public function updateCourse(int $id, string $title, string $description, int $category, int $language_id): void
    {

        $table = $this->verifyLanguage();

        $updateCourseQuery = $this->db->prepare("UPDATE $table SET title = :title, description = :description, global_category_id = :global_category_id, language_id = :language_id WHERE id = :id");
        $parameters = ['id' => $id, 'description' => $description, 'title' => $title, 'global_category_id' => $category, 'language_id' => $language_id];
        $updateCourseQuery->execute($parameters);
    }

    public function addCourseInUsersCourses(int $user_id, int $course_id): void
    {
        $insertCourseQuery = $this->db->prepare('INSERT INTO users_courses (user_id, course_id, locked, finished) VALUES (:user_id, :course_id, :locked, :finished)');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id, 'locked' => 1, 'finished' => 0];
        $insertCourseQuery->execute($parameters);
    }

    public function addCourse(string $title, string $description, int $category, int $language_id): void
    {
        $insertCourse_de = $this->db->prepare("INSERT INTO courses_de (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");
        $insertCourse_en = $this->db->prepare("INSERT INTO courses_en (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");
        $insertCourse_es = $this->db->prepare("INSERT INTO courses_es (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");
        $insertCourse_fr = $this->db->prepare("INSERT INTO courses_fr (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");
        $insertCourse_it = $this->db->prepare("INSERT INTO courses_it (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");
        $insertCourse_ru = $this->db->prepare("INSERT INTO courses_ru (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)");

        $parameters = ['title' => $title, 'description' => $description, 'global_category_id' => $category, 'language_id' => $language_id];

        $insertCourse_de->execute($parameters);
        $insertCourse_en->execute($parameters);
        $insertCourse_es->execute($parameters);
        $insertCourse_fr->execute($parameters);
        $insertCourse_it->execute($parameters);
        $insertCourse_ru->execute($parameters);
    }

    public function getAllCourse(): ?array
    {

        $table = $this->verifyLanguage();
        $languageId = $this->verifyLanguageId();

        $selectAllCoursesByCat = $this->db->prepare("SELECT * FROM $table WHERE language_id = $languageId");
        $selectAllCoursesByCat->execute();

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        if ($courses_data) {
            $course_array = [];


            foreach ($courses_data as $key => $course_data) {
                $gc = new GlobalCategoryManager;
                $global_category = $gc->getOneCatById($course_data['global_category_id']);
                $course = new Course($course_data['title'], $course_data['description'], $global_category);
                $course->setId($course_data['id']);
                $course_array[] = $course;
            }
            return $course_array;
        } else {
            return null;
        }
    }

    public function getAllCourseWithoutLanguageId(): ?array
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByCat = $this->db->prepare("SELECT * FROM $table");
        $selectAllCoursesByCat->execute();

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        if ($courses_data) {
            $course_array = [];


            foreach ($courses_data as $key => $course_data) {
                $gc = new GlobalCategoryManager;
                $global_category = $gc->getOneCatById($course_data['global_category_id']);
                $course = new Course($course_data['title'], $course_data['description'], $global_category);
                $course->setId($course_data['id']);
                $course_array[] = $course;
            }
            return $course_array;
        } else {
            return null;
        }
    }

    public function getCourseByUser(int $user_id, int $course_id, int $language_id): ?array
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByUser = $this->db->prepare("SELECT users_courses.*, $table.* FROM users_courses 
        JOIN $table 
        ON $table.id = users_courses.course_id  
        WHERE users_courses.user_id = :user_id AND users_courses.course_id = :course_id AND $table.language_id = :language_id");
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id, 'language_id' => $language_id];
        $selectAllCoursesByUser->execute($parameters);


        $courses_data = $selectAllCoursesByUser->fetchAll(PDO::FETCH_ASSOC);

        if ($courses_data) {
            $course_array = [];


            foreach ($courses_data as $key => $course_data) {
                $gc = new GlobalCategoryManager;
                $global_category = $gc->getOneCatById($course_data['global_category_id']);
                $course = new Course($course_data['title'], $course_data['description'], $global_category);
                $course->setId($course_data['id']);
                $course->setLocked($course_data['locked']);
                $course->setFinished($course_data['finished']);
                $course_array[] = $course;
            }
            return $course_array;
        } else {
            return null;
        }
    }

    public function getCourseFromUserById(int $user_id, int $course_id): ?Course
    {

        $table = $this->verifyLanguage();

        $selectAllCoursesByCat = $this->db->prepare("SELECT $table.*, $table.id AS course_id, users_courses.finished AS users_courses_finished, users_courses.locked AS users_courses_locked FROM $table JOIN users_courses ON users_courses.course_id = $table.id WHERE users_courses.user_id = :user_id AND users_courses.course_id = :course_id");
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetch(PDO::FETCH_ASSOC);

        if ($courses_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($courses_data['global_category_id']);
            $course = new Course($courses_data['title'], $courses_data['description'], $global_category);
            $course->setId($courses_data['course_id']);
            $course->setLocked($courses_data['users_courses_locked']);
            $course->setFinished($courses_data['users_courses_finished']);
            return $course;
        } else {
            return null;
        }
    }

    public function getFinishedCourseByUser(int $user_id, int $course_id): ?array
    {
        $selectFinishedCourseByUser = $this->db->prepare('SELECT * FROM users_courses WHERE user_id = :user_id AND course_id = :course_id AND finished = 1');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $selectFinishedCourseByUser->execute($parameters);

        $courses_data = $selectFinishedCourseByUser->fetchAll(PDO::FETCH_ASSOC);


        if ($courses_data) {
            $course_array = [];


            foreach ($courses_data as $key => $course_data) {
                $course_array[] = $course_data;
            }
            return $course_array;
        } else {
            return null;
        }
    }

    public function getTotalCoursesByCatAndLang(int $category_id, int $language_id): ?int
    {

        $table = $this->verifyLanguage();

        $selectTotalCoursesByCatAndLangQuery = $this->db->prepare("SELECT COUNT(*) FROM $table WHERE global_category_id = :global_category_id AND language_id = :language_id");

        $parameters = ['global_category_id' => $category_id, 'language_id' => $language_id];
        $selectTotalCoursesByCatAndLangQuery->execute($parameters);

        $totalCourses = $selectTotalCoursesByCatAndLangQuery->fetch(PDO::FETCH_COLUMN);

        if ($totalCourses) {
            return $totalCourses;
        } else {
            return null;
        }
    }

    public function getTotalFinishedCoursesByUser(int $category_id, int $user_id, int $language_id): ?int
    {

        $table = $this->verifyLanguage();

        $selectTotalFinishedCoursesByUserQuery = $this->db->prepare("SELECT COUNT(*) FROM users_courses JOIN $table ON $table.id = users_courses.course_id WHERE $table.global_category_id = :global_category_id AND language_id = :language_id AND users_courses.user_id = :user_id AND finished = 1");

        $parameters = ['global_category_id' => $category_id, 'language_id' => $language_id, 'user_id' => $user_id];
        $selectTotalFinishedCoursesByUserQuery->execute($parameters);

        $totalCourses = $selectTotalFinishedCoursesByUserQuery->fetch(PDO::FETCH_COLUMN);

        if ($totalCourses) {
            return $totalCourses;
        } else {
            return null;
        }
    }
}
