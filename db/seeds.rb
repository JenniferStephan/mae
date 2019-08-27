User.destroy_all!
Client.destroy_all!
Invoice.destroy_all!




user = User.create!(email: "jenn@lewagon.com",
                    password: "testtest",
                    first_name: "Jenn",
                    last_name: "Step",
                    username: "jenn",
                    siret: "54645643",
                    vat: 0,
                    address: "13 rue morand")

client = Client.create!(user: user, email: "aurore@lewagon.com", first_name: "aurore", last_name: "Step", category: "pro", address: "14 rue morand")

invoice_draft = Invoice.create!(title: "draft")
invoice_sent = Invoice.create!(title: "draft")


