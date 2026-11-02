#import "/layout/proposal_template.typ": *
#import "/layout/author_declaration.typ": *

#let metadata = toml("metadata.toml")
#set document(title: metadata.thesis.title, author: metadata.author.name)
#show: proposal.with(metadata, bib_path: "/thesis.bib")

// =============================================================================
// =============================== Front matter ================================
// =============================================================================

#abstract-page(
  include "content/abstract.typ"
)

#table-of-contents()

// Switch to arabic page numbers (front matter above uses roman numerals)
#show: main-matter

// =============================================================================
// =============================== Main content ================================
// =============================================================================

#include "content/chapter01.typ"
#include "content/chapter02.typ"

// =============================================================================
// ============================= Appendix section ==============================
// =============================================================================

// Chapters after this line are numbered A, B, ...
#show: appendix

#include "content/appendix01.typ"

#pagebreak(weak: true)

#author_declaration(
  metadata.author.name,
  metadata.author.signature_place,
  metadata.dates.submission,
  metadata.settings.language,
)
#list-of-figures()
#list-of-tables()

