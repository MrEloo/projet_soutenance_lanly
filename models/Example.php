<?php


class Example
{

    private ?int $id = null;
    private int $course_id;
    private int $language_id;

    public function __construct(private string $description)
    {
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
     * Get the value of language_id
     */ 
    public function getLanguage_id()
    {
        return $this->language_id;
    }

    /**
     * Set the value of language_id
     *
     * @return  self
     */ 
    public function setLanguage_id($language_id)
    {
        $this->language_id = $language_id;

        return $this;
    }
}
