<?php


class Course
{

    private ?int $id = null;
    private array $examples = [];

    public function __construct(private string $title, private string $description)
    {
        $this->title = $title;
        $this->description = $description;
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
}
