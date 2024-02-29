<?php


class Reason
{
    private ?int $id = null;

    public function __construct(private string $name, private ReasonCategory $reasonCategory)
    {
        $this->name = $name;
        $this->$reasonCategory = $reasonCategory;
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
