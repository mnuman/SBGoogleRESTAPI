xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://xmlns.qualogy.com/blog/mnuman/Google/Tasks";
(:: import schema at "../Schemas/GoogleTasksAsJSON.xsd" ::)
declare namespace ns1="http://xmlns.qualogy.com/blog/mnuman/Tasks";
(:: import schema at "../Schemas/Tasks.xsd" ::)

declare variable $googleListOfTasks as element() (:: schema-element(goo:ListOfTasks) ::) external;

declare function local:func($googleListOfTasks as element() (:: schema-element(goo:ListOfTasks) ::)) as element() (:: schema-element(ns1:GetTasksRpy) ::) {
    <ns1:GetTasksRpy>{for $task in $googleListOfTasks/goo:items
                      return <ns1:Task>
                          <ns1:ID>{fn:data($task/goo:id)}</ns1:ID>
                          <ns1:Title>{fn:data($task/goo:title)}</ns1:Title>
                          <ns1:Status>{fn:data($task/goo:status)}</ns1:Status>
                          {
                              if ($task/goo:notes)
                              then <ns1:Notes>{fn:data($task/goo:notes)}</ns1:Notes>
                              else ()
                          }
                          <ns1:LastUpdated>{fn:data($task/goo:updated)}</ns1:LastUpdated>
                          {
                              if ($task/goo:due)
                              then <ns1:DueDate>{fn:data($task/goo:due)}</ns1:DueDate>
                              else ()
                          }
                          {
                              if ($task/goo:completed)
                              then <ns1:CompletionDate>{fn:data($task/goo:completed)}</ns1:CompletionDate>
                              else ()
                          }
                      </ns1:Task>
                     }
    </ns1:GetTasksRpy>
};

local:func($googleListOfTasks)
