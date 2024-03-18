<?php


class GlobalCategory
{
    private ?int $id = null;
    private int $progression;

    public function __construct(private string $name)
    {
        $this->name = $name;
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
     * Get the value of name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name
     *
     * @return  self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get the value of progression
     */ 
    public function getProgression()
    {
        return $this->progression;
    }

    /**
     * Set the value of progression
     *
     * @return  self
     */ 
    public function setProgression($progression)
    {
        $this->progression = $progression;

        return $this;
    }
}
