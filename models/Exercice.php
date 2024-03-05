<?php


class Exercice
{

    private ?int $id = null;
    private Response $response;
    private ?int $result;

    public function __construct(private string $title, private string $difficulty, private string $question, private string $correction_Text, private string $correction, private GlobalCategory $globalCategory, private int $course_id)
    {
        $this->title = $title;
        $this->difficulty = $difficulty;
        $this->question = $question;
        $this->correction_Text = $correction_Text;
        $this->correction = $correction;
        $this->globalCategory = $globalCategory;
        $this->course_id = $course_id;
    }

    /**
     * Get the value of id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of difficulty
     */
    public function getDifficulty()
    {
        return $this->difficulty;
    }

    /**
     * Set the value of difficulty
     *
     * @return  self
     */
    public function setDifficulty($difficulty)
    {
        $this->difficulty = $difficulty;

        return $this;
    }

    /**
     * Get the value of question
     */
    public function getQuestion()
    {
        return $this->question;
    }

    /**
     * Set the value of question
     *
     * @return  self
     */
    public function setQuestion($question)
    {
        $this->question = $question;

        return $this;
    }

    /**
     * Get the value of correction
     */
    public function getCorrection()
    {
        return $this->correction;
    }

    /**
     * Set the value of correction
     *
     * @return  self
     */
    public function setCorrection($correction)
    {
        $this->correction = $correction;

        return $this;
    }

    /**
     * Get the value of globalCategory
     */
    public function getGlobalCategory()
    {
        return $this->globalCategory;
    }

    /**
     * Set the value of globalCategory
     *
     * @return  self
     */
    public function setGlobalCategory($globalCategory)
    {
        $this->globalCategory = $globalCategory;

        return $this;
    }


    /**
     * Get the value of title
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set the value of title
     *
     * @return  self
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }


    /**
     * Get the value of correction_Text
     */
    public function getCorrection_Text()
    {
        return $this->correction_Text;
    }

    /**
     * Set the value of correction_Text
     *
     * @return  self
     */
    public function setCorrection_Text($correction_Text)
    {
        $this->correction_Text = $correction_Text;

        return $this;
    }


    /**
     * Get the value of course_id
     */
    public function getCourse_id()
    {
        return $this->course_id;
    }

    /**
     * Set the value of course_id
     *
     * @return  self
     */
    public function setCourse_id($course_id)
    {
        $this->course_id = $course_id;

        return $this;
    }

    /**
     * Get the value of responses
     */
    public function getResponse()
    {
        return $this->response;
    }

    /**
     * Set the value of responses
     *
     * @return  self
     */
    public function setResponse($response)
    {
        $this->response = $response;

        return $this;
    }

    /**
     * Get the value of result
     */
    public function getResult()
    {
        return $this->result;
    }

    /**
     * Set the value of result
     *
     * @return  self
     */
    public function setResult($result)
    {
        $this->result = $result;

        return $this;
    }
}
