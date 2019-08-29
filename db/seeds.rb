MissionsInvoice.destroy_all
Mission.destroy_all
Invoice.destroy_all
Client.destroy_all
User.destroy_all


user = User.create!(email: "jenn@lewagon.com",
                    password: "testtest",
                    first_name: "Jenn",
                    last_name: "Step",
                    username: "jenn",
                    siret: "54645643",
                    vat: 0,
                    address: "13 rue morand")

client = Client.create!(user: user,
                        email: "aurore@lewagon.com",
                        first_name: "aurore",
                        last_name: "Step",
                        category: "pro",
                        company_address: "14 rue morand")

# puts "creating first draft invoice"
# invoice_draft = Invoice.new(user: user, title: "test1 with invoice draft")
# invoice_draft.save
# puts invoice_draft
# puts "first draft invoice created"

# puts "creating first draft invoice"
# invoice_sent = Invoice.new(user: user, title: "test2")
# invoice_sent.sent!
# invoice_sent.save



invoice1 = Invoice.new(user: user,
                      title: "Journée TA",
                      reference: "210819-AC0001",
                      creation_date: "21/08/19",
                      due_date: "21/09/19",
                      total_amount_ttc: "1800",
                      status: 0)
invoice1.save

invoice2 = Invoice.new(user: user,
                      title: "Webdesign UX/UI",
                      reference: "140519-AC0002",
                      creation_date: "14/05/19",
                      due_date: "14/06/19",
                      total_amount_ttc: "4000",
                      status: 4)
invoice2.save

invoice3 = Invoice.new(user: user,
                      title: "Développement",
                      reference: "050319-AC0003",
                      creation_date: "05/03/19",
                      due_date: "05/03/19",
                      total_amount_ttc: "3600",
                      status: 3)
invoice3.save

invoice4 = Invoice.new(user: user,
                      title: "Front-end",
                      reference: "120119-AC0004",
                      creation_date: "12/01/19",
                      due_date: "12/01/19",
                      total_amount_ttc: "3100",
                      status: 3)
invoice4.save

invoice5 = Invoice.new(user: user,
                      title: "Mission Consulting",
                      reference: "120119-AC0004",
                      creation_date: "12/01/19",
                      due_date: "12/01/19",
                      total_amount_ttc: "4300",
                      status: 5)
invoice5.save

invoice6 = Invoice.new(user: user,
                      title: "Webdesign UX/UI",
                      reference: "120119-AC0004",
                      creation_date: "12/01/19",
                      due_date: "12/01/19",
                      total_amount_ttc: "1700",
                      status: 5)
invoice6.save

invoice7 = Invoice.new(user: user,
                      title: "Mission développement",
                      reference: "221118-AC0004",
                      creation_date: "22/10/18",
                      due_date: "22/11/18",
                      total_amount_ttc: "2000",
                      status: 5)
invoice7.save

invoice8 = Invoice.new(user: user,
                      title: "Front-end",
                      reference: "040918-AC0004",
                      creation_date: "04/09/18",
                      due_date: "04/10/18",
                      total_amount_ttc: "2000",
                      status: 5)
invoice8.save



web_design = Mission.create!(name: "web design", description: "doing some website")

puts "creating first draft invoice"
web_design_for_beta = MissionsInvoice.create!(man_day_quantity: 3, price_rate: 100, vat_rate: 0, mission: web_design, invoice: invoice1)

puts web_design_for_beta
