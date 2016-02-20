xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://xmlns.qualogy.com/blog/mnuman/Google/Tasks";
(:: import schema at "../Schemas/GoogleTasksAsJSON.xsd" ::)
declare namespace ns1="http://xmlns.qualogy.com/blog/mnuman/Tasks";
(:: import schema at "../Schemas/Tasks.xsd" ::)

declare variable $googleTask as element() (:: schema-element(goo:Task) ::) external;

declare function local:func($googleTask as element() (:: schema-element(goo:Task) ::)) as element() (:: schema-element(ns1:CreateTaskRpy) ::) {
    <ns1:CreateTaskRpy>
        <ns1:Task>
            <ns1:ID>{fn:data($googleTask/goo:id)}</ns1:ID>
            <ns1:Title>{fn:data($googleTask/goo:title)}</ns1:Title>
            <ns1:Status>{fn:data($googleTask/goo:status)}</ns1:Status>
            {
                if ($googleTask/goo:notes)
                then <ns1:Notes>{fn:data($googleTask/goo:notes)}</ns1:Notes>
                else ()
            }
            <ns1:LastUpdated>{fn:data($googleTask/goo:updated)}</ns1:LastUpdated>
            {
                if ($googleTask/goo:due)
                then <ns1:DueDate>{fn:data($googleTask/goo:due)}</ns1:DueDate>
                else ()
            }
            {
                if ($googleTask/goo:completed)
                then <ns1:CompletionDate>{fn:data($googleTask/goo:completed)}</ns1:CompletionDate>
                else ()
            }
        </ns1:Task>
    </ns1:CreateTaskRpy>
};

local:func($googleTask)
