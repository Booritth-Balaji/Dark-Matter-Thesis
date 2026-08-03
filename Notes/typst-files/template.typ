// ============================================================================
// 1. TEMPLATE DEFINITION (You can later move this to a 'template.typ' file)
// ============================================================================

#let research-notes(
  title: "Title",
  author: "Author",
  affiliation: none,
  supervisor: none,
  date: "",
  body
) = {
  // Document Metadata
  set document(title: title, author: author)

  // Page Setup
  set page(
    paper: "a4",
    numbering: "1",
    number-align: center,
    margin: (x: 0.7in, y: 1in),
  )

  // Typography Setup (Optimized for heavy math)
  // "New Computer Modern" is the standard LaTeX font, excellent for reading equations.
  set text(
    font: "New Computer Modern",
    size: 12pt,
    lang: "en"
  )
  
  // Increase line spacing slightly to give inline math fractions room to breathe
  set par(justify: true, leading: 0.8em)
  set par(spacing: 1.8em)

  // Math Setup: Clean numbering and extra vertical space around block equations
  set math.equation(numbering: "(1)")
  show math.equation.where(block: true): set block(above: 1.5em, below: 1.5em)

  // ------------------------------------------------------------------------
  // 2. The Cover Page
  // ------------------------------------------------------------------------
  align(center + horizon)[
    #text(weight: "bold", size: 2.5em, title)
    #v(2em, weak: true)
    #text(size: 1.4em, weight: "semibold", author)
    
    // I added optional affiliation and supervisor fields as a suggestion 
    // for a professional academic research note.
    #if affiliation != none {
      v(0.5em)
      text(size: 1.2em, affiliation)
    }
    
    #if supervisor != none {
      v(0.5em)
      text(size: 1.1em, style: "italic")[Advisor: #supervisor]
    }
    
    #v(1em)
    #text(size: 1.1em, date)
  ]

  pagebreak()

  // ------------------------------------------------------------------------
  // 3. The Table of Contents
  // ------------------------------------------------------------------------
  // Typst automatically makes the outline clickable. 
  // We format the top-level headings to be bold.
  show outline.entry.where(level: 1): it => {
    v(1em, weak: true)
    strong(it)
  }
  
  align(center)[
    #text(size: 1.5em, weight: "bold", "Table of Contents")
  ]
  v(1.5em)
  outline(depth: 3, indent: 1em, title: none)

  pagebreak()

  // ------------------------------------------------------------------------
  // Main Content Settings
  // ------------------------------------------------------------------------
  
  // Auto-number all headings
  set heading(numbering: "1.1.")
  show heading: it => {
    v(2.5em, weak: true)
    it
    v(1.5em, weak: true)
  }

  // Output the rest of the document
  body
}

// ============================================================================
// 4. CUSTOM COMPONENTS (Highlighter & Theory Boxes)
// ============================================================================

// Custom Highlighter
// Gives a clean, pale yellow background with slight padding around the text
#let hl(content) = highlight(fill: rgb("#fff7ae"), extent: 2pt, content)

// Breakable Theory Box
// A neat box with a soft blue-gray tint and a darker left accent line.
// The `breakable: true` argument is what allows it to span across page breaks smoothly.
#let theory-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#f4f7fb"), 
  stroke: (left: 3pt + rgb("#28649b")), 
  inset: (x: 1.2em, y: 1em),
  radius: (right: 4pt),
  breakable: true, 
  [
    #if title != none {
      text(weight: "bold", fill: rgb("#1a4166"), size: 1.1em, title)
      v(0.5em)
    }
    #body
  ]
)

#let math-box(body) = rect(
  fill: rgb("#f4f7fb"), 
  stroke: 1.5pt + rgb("#28649b"), 
  radius: 4pt,
  inset: 1em,
  body
)

// Custom hotkey settings for chevron symbols: 

#let ket = math.chevron.r
#let bra = math.chevron.l

#let difp(var) = $ (dif^3 var) / (2 pi)^3 $  