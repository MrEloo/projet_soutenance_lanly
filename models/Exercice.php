<?php


class Exercice
{

    private ?int $id = null;

    public function __construct(private string $difficulty, private string $question, private string $correction, private GlobalCategory $globalCategory, private ReasonCategory $reasonCategory)
    {
        $this->difficulty = $difficulty;
        $this->question = $question;
        $this->correction = $correction;
        $this->globalCategory = $globalCategory;
        $this->reasonCategory = $reasonCategory;
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
     * Get the value of reasonCategory
     */
    public function getReasonCategory()
    {
        return $this->reasonCategory;
    }

    /**
     * Set the value of reasonCategory
     *
     * @return  self
     */
    public function setReasonCategory($reasonCategory)
    {
        $this->reasonCategory = $reasonCategory;

        return $this;
    }
}
