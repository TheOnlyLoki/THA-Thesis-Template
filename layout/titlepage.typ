#import "./utils/helpers.typ": toml_to_datetime
#import "@preview/linguify:0.4.2": linguify

#let titlepage(metadata) = {
  let tha-red = rgb(255, 3, 80)
  let logo_path = "./figures/Logo.svg"

  set page(
    margin: (left: 27mm, right: 15mm, top: 20mm, bottom: auto),
    header-ascent: 0mm,
    header: none,
  )

  set text(font: "Nimbus Sans")

  set par(leading: 6pt)

  grid(
    columns: (126.9mm, 1fr),
    column-gutter: 7.4mm,
    [
      #if logo_path != "" [
        #place(dx: -0.65mm)[
          #image(logo_path, width: 60mm)
        ]
      ]
    ],
    [
      #text(fill: tha-red, weight: "bold", size: 12pt)[#metadata.thesis.faculty]
    ],
  )

  v(18.2mm)

  grid(
    columns: (126.9mm, 1fr),
    column-gutter: 7.4mm,
    [
      #set par(leading: 0.45mm)

      #text(fill: tha-red, size: 18pt, weight: "bold")[#metadata.thesis.type] \
      #v(-5pt)
      #text(size: 12pt)[#linguify("reachingDegree")] \
      #v(-8pt)
      #text(size: 12pt)[#metadata.thesis.study_degree #linguify("inLabel") #metadata.thesis.study_program]
      #v(12mm)
      #text(fill: tha-red, size: 18pt, weight: "bold")[#metadata.thesis.title]
      #v(9.5mm)
      #text(size: 11pt)[#linguify("createdBy")]
      #text(size: 15pt)[#metadata.author.name]
      #v(50.7mm)

      #set text(size: 11pt)
      #line(length: 100%, stroke: 1pt)
      #v(-1.7mm)
      #pad(left: 2.11mm)[
        #grid(
          columns: (auto, 1fr),
          row-gutter: 3.5mm,
          column-gutter: 4.1mm,
          align: (left, left),

          [#linguify("supervisor")], [#metadata.thesis.supervisor],
          ..if metadata.thesis.at("supervisor_deputy", default: none) != none {
            ([#linguify("supervisorDeputy")], [#metadata.thesis.supervisor_deputy])
          } else {
            ()
          },
          [#linguify("topicAssignment")],
          [#toml_to_datetime(metadata.dates.topic_assignment).display("[day]. [month repr:long] [year]")],
          [#linguify("submittedOn")],
          [#toml_to_datetime(metadata.dates.submission).display("[day]. [month repr:long] [year]")],
          ..if metadata.dates.at("defense", default: none) != none {
            (
              [#linguify("defenseOn")],
              [#toml_to_datetime(metadata.dates.defense).display("[day]. [month repr:long] [year]")],
            )
          } else {
            ()
          },
          [#linguify("nda")], [#if metadata.settings.non_disclosure [#linguify("yes")] else [#linguify("no")]],
        )
      ]
      #v(-1.8mm)
      #line(length: 100%, stroke: 1pt)
    ],
    [
      #set par(leading: 1.6mm)
      #let extra_spacing = 0mm
      #v(68.5mm)
      #text(size: 7pt, weight: "bold")[#metadata.author.name]
      #v(-0.15mm)
      #if metadata.author.street != "" [
        #text(size: 7pt)[#metadata.author.street]
        #linebreak()
      ] else {
        extra_spacing = extra_spacing + 9.5pt
      }
      #if metadata.author.zip != "" or metadata.author.city != "" [
        #text(size: 7pt)[#metadata.author.zip #metadata.author.city]
        #linebreak()
      ] else {
        extra_spacing = extra_spacing + 9.5pt
      }
      #if metadata.author.phone != "" [
        #text(size: 7pt)[T #metadata.author.phone]
        #linebreak()
      ] else {
        extra_spacing = extra_spacing + 9.5pt
      }
      #if metadata.author.email != "" [
        #text(size: 7pt)[#metadata.author.email]
        #v(3mm)
      ] else {
        extra_spacing = extra_spacing + 28pt
      }
      #text(size: 7pt)[#linguify("enrolmentNumber"):]
      #linebreak()
      #text(size: 7pt)[#metadata.author.enrolment_no]
      #v(4.7mm + extra_spacing)
      #text(fill: tha-red, size: 7pt, weight: "bold")[#metadata.university.name]
      #v(-0.15mm)
      #text(size: 7pt)[#metadata.university.address]
      #linebreak()
      #text(size: 7pt)[#metadata.university.zip #metadata.university.city]
      #linebreak()
      #text(size: 7pt)[T #metadata.university.phone]
      #linebreak()
      #text(size: 7pt)[F #metadata.university.fax]
      #linebreak()
      #text(size: 7pt)[#metadata.university.url]
      #linebreak()
      #text(size: 7pt)[#metadata.university.email]
    ],
  )

  pagebreak()
}
