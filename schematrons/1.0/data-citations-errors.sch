<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 2019 JATS4Reuse (https://jats4r.org)
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    -->

<pattern id="data-citations-errors" 
         xmlns="http://purl.oclc.org/dsdl/schematron"
         xmlns:j4r="http://jats4r.org/ns">

  <rule context="mixed-citation | element-citation">
    <report test="data-title and not(@publication-type='data')">
       When &lt;data-title> element is present, the @citation-type must be set to "data". 
    </report>
    <report test="@publication-type='data' and 
      (not(source) and not(data-title))">
      &lt;data-title> and/or &lt;source> must be present in data citations. 
    </report>
    <report test="@publication-type='data' and 
      (article-title and not(data-title))">
      &lt;data-title> must be used in data citations, not &lt;article-title>.
    </report>
    
      <report test="@citation-type">
        Use @publication-type (and @publication-format and @publisher-type) rather than @citation-type.
      </report>
    
  </rule>

  <rule context="year[ancestor::mixed-citation or ancestor::element-citation]">
    <assert test="matches(.,'^([1][4-9]|[2][0])[0-9][0-9]$')">
      &lt;year> in a citation must be a valid 4-digit year. "<value-of select="."/>" 
      was supplied 
    </assert>
  </rule>

  <rule context="version">
    <assert test="normalize-space(@designator)">
      &lt;version> must include a machine-readable version number in the @designator. 
    </assert>
  </rule>

<!-- The following are generla citaiton errors -->
  <rule context="ref">
    <report test="nlm-citation">
      &lt;nlm-citaiton> has been deprecsted. Use &lt;element-citation>.
    </report>
    <report test="citation">
      Use &lt;mixed-citation> rather than &lt;citation>.
    </report>
    <report test="not(@id)">
      Each &lt;ref> must have an @id.
    </report>
  </rule>



</pattern>


