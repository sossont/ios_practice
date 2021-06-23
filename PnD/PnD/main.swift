protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic {
    func performCPR(){
        print("The paramedic does chest compressions, 30 per second.")
    }
}
