User.destroy_all
Client.destroy_all
Invoice.destroy_all
Mission.destroy_all
MissionsInvoice.destroy_all


user = User.create!(email: "jenn@lewagon.com",
                    password: "testtest",
                    first_name: "Jenn",
                    last_name: "Stephan",
                    username: "jenn",
                    siret: "54645643",
                    vat: 0,
                    address: "13 rue morand")

societe_generale = Client.create!(user: user,
                        email: "aurore@soce.com",
                        first_name: "aurore",
                        last_name: "malval",
                        category: "pro",
                        company_name: "societe generale",
                        company_address: "14 rue morand")

bnp = Client.create!(user: user,
                        email: "camille@bnp.com",
                        first_name: "camille",
                        last_name: "ole",
                        category: "pro",
                        company_name: "bnp",
                        company_address: "la defense")

credit_agricole = Client.create!(user: user,
                        email: "antoine@credit.com",
                        first_name: "antoine",
                        last_name: "cartier",
                        category: "pro",
                        company_name: "ca",
                        company_address: "la defense")



puts "creating first draft invoice"
invoice_draft = Invoice.new(user: user, title: "test1 with invoice draft")
invoice_draft.save
puts invoice_draft
puts "first draft invoice created"

puts "creating first draft invoice"
invoice_sent = Invoice.new(user: user, title: "test2")
invoice_sent.sent!
invoice_sent.save

puts invoice_draft

puts "second draft invoice created"

web_design = Mission.create!(name: "web design", description: "doing some website")
jour_TA = Mission.create!(name: "jour de TA")
bus_dev = Mission.create!(name: "business dev")
maintenance_site = Mission.create!(name: "maintenance site web")

puts "creating first draft invoice"
web_design_for_beta = MissionsInvoice.create!(man_day_quantity: 3, price_rate: 100, vat_rate: 0, mission: web_design, invoice: invoice_draft)

puts web_design_for_beta
