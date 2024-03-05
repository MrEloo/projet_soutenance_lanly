<?php


class Course
{

    private ?int $id = null;
    private array $examples = [];
    private array $exercices = [];
    private int $locked;
    private bool $finished;


    public function __construct(private string $title, private string $description, private GlobalCategory $globalCategory)
    {
        $this->title = $title;
        $this->description = $description;
        $this->globalCategory = $globalCategory;
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
     * Get the value of description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @return  self
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get the value of examples
     */
    public function getExamples()
    {
        return $this->examples;
    }

    /**
     * Set the value of examples
     *
     * @return  self
     */
    public function setExamples($examples)
    {
        $this->examples = $examples;

        return $this;
    }

    /**
     * Get the value of exercices
     */
    public function getExercices()
    {
        return $this->exercices;
    }

    /**
     * Set the value of exercices
     *
     * @return  self
     */
    public function setExercices($exercices)
    {
        $this->exercices = $exercices;

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
     * Get the value of locked
     */
    public function getLocked()
    {
        return $this->locked;
    }

    /**
     * Set the value of locked
     *
     * @return  self
     */
    public function setLocked($locked)
    {
        $this->locked = $locked;

        return $this;
    }

    /**
     * Get the value of finished
     */
    public function getFinished()
    {
        return $this->finished;
    }

    /**
     * Set the value of finished
     *
     * @return  self
     */
    public function setFinished($finished)
    {
        $this->finished = $finished;

        return $this;
    }
}
