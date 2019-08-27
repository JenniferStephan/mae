User.destroy_all
Client.destroy_all
Invoice.destroy_all
Mission.destroy_all
MissionsInvoice.destroy_all


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

puts "creating first draft invoice"
invoice_draft = Invoice.new(user: user, client: client, title: "test1 with invoice draft")
invoice_draft.save
puts invoice_draft
puts "first draft invoice created"

puts "creating first draft invoice"
invoice_sent = Invoice.new(user: user, client: client, title: "test2")
invoice_sent.sent!
invoice_sent.save

puts invoice_draft

puts "second draft invoice created"

web_design = Mission.create!(name: "web design", description: "doing some website")

puts "creating first draft invoice"
web_design_for_beta = MissionsInvoice.create!(man_day_quantity: 3, price_rate: 100, vat_rate: 0, mission: web_design, invoice: invoice_draft)

puts web_design_for_beta
