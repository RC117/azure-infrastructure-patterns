# Pragmatic Team Workshop Guide

> **Fast-track team learning with structured, time-boxed workshops**

## 🎯 Workshop Philosophy

**Principles**:

- **Time-boxed**: Maximum 2 hours per session
- **Action-oriented**: Every session produces deliverables
- **Inclusive**: Everyone contributes, challenge encouraged
- **Practical**: Focus on our specific context, not theory

**Outcome**: Team alignment + shared understanding + actionable decisions

---

## 📅 Workshop Schedule (2-Week Sprint)

### Week 1: Research & Discovery

- **Monday**: Current State Analysis Workshop
- **Wednesday**: Pain Points & Prioritization Workshop
- **Friday**: Best Practices Learning Session

### Week 2: Design & Decision

- **Monday**: Target Architecture Design Workshop
- **Wednesday**: Implementation Planning Workshop
- **Friday**: Risk Assessment & Go/No-Go Decision

---

## 🔍 Workshop 1: Current State Analysis (2 hours)

### **Objective**: Create shared understanding of existing infrastructure

### **Pre-work** (Individual, 30 minutes)

Each team member runs discovery commands and documents findings:

```bash
# Infrastructure Discovery Assignment
az account show --output table
az group list --output table
az network vnet list --output table
az vmss list --output table
az postgres flexible-server list --output table

# Personal reflection questions:
# 1. What surprises you about our current setup?
# 2. What would you change if starting fresh?
# 3. What are you most worried about?
```

### **Workshop Agenda**

#### **Round 1: Findings Share-out** (45 minutes)

- **Format**: 5 minutes per person + 5 minutes Q&A
- **Each person presents**:
  - Most important discovery
  - Biggest surprise
  - Top concern
- **Facilitator captures**: All findings on shared board

#### **Round 2: Pattern Recognition** (30 minutes)

- **Activity**: Group similar findings into themes
- **Themes typically emerge**:
  - Security gaps
  - Scalability bottlenecks
  - Manual processes
  - Cost waste
  - Reliability risks

#### **Round 3: Impact Assessment** (30 minutes)

- **Activity**: Rate each theme on:
  - **Business Impact**: High/Medium/Low
  - **Technical Risk**: High/Medium/Low
  - **Effort to Fix**: High/Medium/Low
- **Output**: Prioritized improvement areas

#### **Round 4: Questions for Research** (15 minutes)

- **Activity**: Generate specific research questions
- **Example questions**:
  - "How do other companies handle zero-downtime deployments with VMSS?"
  - "What's the ROI of implementing blue-green deployment?"
  - "How much would immutable infrastructure reduce our operational overhead?"

### **Deliverables**

- [ ] Current state documentation (consolidated findings)
- [ ] Prioritized improvement themes
- [ ] Research question backlog

---

## 😤 Workshop 2: Pain Points & Prioritization (1.5 hours)

### **Objective**: Identify and prioritize what needs to be fixed most urgently

### **Pre-work** (Individual, 15 minutes)

```text
Think about the last 6 months:
1. What infrastructure issue cost us the most time?
2. What prevents us from deploying more frequently?
3. What keeps you up at night about our infrastructure?
4. What do other teams complain about regarding our infrastructure?
```

### **Workshop Agenda**

#### **Round 1: Pain Point Brain Dump** (20 minutes)

- **Format**: Silent sticky note session
- **Rules**: One pain point per sticky, be specific
- **Example good pain point**: "VMSS scaling takes 15 minutes, causing 500 errors during traffic spikes"
- **Example bad pain point**: "Everything is slow"

#### **Round 2: Grouping & Discussion** (30 minutes)

- **Activity**: Group similar pain points, discuss patterns
- **Encourage challenges**: "Is this actually a problem or just annoying?"
- **Focus on business impact**: "How does this affect customers/revenue?"

#### **Round 3: DORA Impact Mapping** (25 minutes)

Map each pain point group to DORA metrics:

- **Deployment Frequency**: What stops us deploying more often?
- **Lead Time**: What slows down getting changes to production?
- **Change Failure Rate**: What causes rollbacks or incidents?
- **Recovery Time**: What makes incidents take longer to resolve?

#### **Round 4: Quick Wins vs. Strategic Fixes** (15 minutes)

- **Quick Wins**: Can be fixed in 1-2 weeks
- **Strategic Fixes**: Require architecture changes
- **Output**: Two prioritized backlogs

### **Deliverables**

- [ ] Categorized pain point inventory
- [ ] DORA impact assessment
- [ ] Quick wins backlog (start immediately)
- [ ] Strategic fixes backlog (architecture project)

---

## 📚 Workshop 3: Best Practices Learning Session (1.5 hours)

### **Objective**: Rapidly educate team on relevant best practices

### **Pre-work** (Individual, 30 minutes)

Assigned reading/research:

- **Person A**: Research blue-green deployment patterns
- **Person B**: Research immutable infrastructure benefits
- **Person C**: Research Azure security best practices
- **Person D**: Research monitoring and observability
- **Person E**: Research cost optimization strategies

### **Workshop Agenda**

#### **Round 1: Teaching Presentations** (50 minutes)

- **Format**: 10 minutes presentation + 10 minutes discussion per topic
- **Presentation structure**:
  - What is this practice?
  - Why does it matter for our context?
  - What would implementation look like for us?
  - What are the challenges/trade-offs?

#### **Round 2: Practice Evaluation** (25 minutes)

For each practice, team decides:

- **Relevance**: High/Medium/Low for our situation
- **Difficulty**: Hard/Medium/Easy to implement
- **Priority**: Must-have/Should-have/Nice-to-have
- **Timeline**: Quick win/Short-term/Long-term

#### **Round 3: Integration Planning** (15 minutes)

- **Question**: How do these practices work together?
- **Activity**: Create simple integration map
- **Output**: Best practices implementation sequence

### **Deliverables**

- [ ] Best practices evaluation matrix
- [ ] Implementation sequence plan
- [ ] Team knowledge baseline established

---

## 🏗️ Workshop 4: Target Architecture Design (2 hours)

### **Objective**: Collaboratively design our target architecture

### **Pre-work** (Individual, 20 minutes)

Each person sketches their "ideal architecture" based on:

- Current state findings
- Pain points to solve
- Best practices research
- Business constraints

### **Workshop Agenda**

#### **Round 1: Architecture Presentations** (40 minutes)

- **Format**: 8 minutes per person to present their vision
- **Focus on**:
  - Key architectural decisions
  - How it solves identified pain points
  - Trade-offs and concerns
- **Rules**: No criticism during presentations, capture questions

#### **Round 2: Convergence Discussion** (45 minutes)

- **Activity**: Identify common themes across all designs
- **Questions**:
  - What did everyone include? (Probably essential)
  - What were the major disagreements? (Need to resolve)
  - What did no one think of? (Might be important)
- **Facilitate healthy debate**: Encourage different viewpoints

#### **Round 3: Decision Making** (30 minutes)

For each major architectural component, make team decision:

- **Networking**: Hub-spoke vs. single VNet vs. other
- **Compute**: Blue-green VMSS vs. other deployment patterns
- **Storage**: Architecture and access patterns
- **Security**: Zero-trust approach and implementation
- **Monitoring**: Tools and approaches

#### **Round 4: Documentation** (25 minutes)

- **Activity**: Create target architecture diagram
- **Format**: Simple boxes and arrows, focus on clarity
- **Include**: Major components, data flows, trust boundaries

### **Deliverables**

- [ ] Target architecture diagram
- [ ] Key architectural decisions documented
- [ ] Areas needing further research identified

---

## 📋 Workshop 5: Implementation Planning (2 hours)

### **Objective**: Create actionable implementation plan with clear phases

### **Pre-work** (Pairs, 30 minutes)

Break target architecture into implementation chunks:

- **Pair A**: Foundation (networking, security basics)
- **Pair B**: Compute and deployment pipeline
- **Pair C**: Data and storage
- **Pair D**: Monitoring and operations

### **Workshop Agenda**

#### **Round 1: Implementation Chunk Presentations** (40 minutes)

Each pair presents their implementation plan:

- **Scope**: What's included in this chunk
- **Dependencies**: What must exist first
- **Risks**: What could go wrong
- **Success criteria**: How we know it's working
- **Timeline estimate**: Realistic timeframe

#### **Round 2: Dependency Mapping** (30 minutes)

- **Activity**: Create visual dependency map
- **Identify**:
  - Critical path items (blockers)
  - Parallel work opportunities
  - Integration points between chunks
- **Resolve**: Dependency conflicts and circular dependencies

#### **Round 3: Phase Definition** (35 minutes)

Based on dependencies and risk tolerance:

- **Phase 1**: What can we implement immediately?
- **Phase 2**: What builds on Phase 1?
- **Phase 3**: What are the nice-to-haves?
- **Include**: Rollback plan for each phase

#### **Round 4: Epic Story Creation** (15 minutes)

Convert each phase into epic stories using the template:

```
As a [role]
I want [capability]
So that [business value]
```

### **Deliverables**

- [ ] Phased implementation plan
- [ ] Dependency map
- [ ] Epic stories with acceptance criteria
- [ ] Risk mitigation strategies

---

## ⚖️ Workshop 6: Risk Assessment & Go/No-Go (1.5 hours)

### **Objective**: Final validation before committing to implementation

### **Pre-work** (Individual, 20 minutes)

Review all previous workshop outputs and consider:

- What could go wrong with this plan?
- What assumptions might be incorrect?
- What external factors could impact success?
- What would make you vote "no-go"?

### **Workshop Agenda**

#### **Round 1: Risk Identification** (30 minutes)

- **Format**: Structured brainstorming
- **Categories**:
  - **Technical risks**: Implementation complexity, tool limitations
  - **Operational risks**: Team capacity, skill gaps, dependencies
  - **Business risks**: Cost, timeline, customer impact
- **Capture all risks without judgment**

#### **Round 2: Risk Assessment** (30 minutes)

For each risk, evaluate:

- **Probability**: High/Medium/Low
- **Impact**: High/Medium/Low
- **Mitigation**: What can we do to reduce/eliminate?
- **Contingency**: What if mitigation doesn't work?

#### **Round 3: Go/No-Go Discussion** (20 minutes)

**Team evaluates readiness**:

- Do we understand the problem well enough?
- Is the solution technically sound?
- Do we have necessary skills/resources?
- Are risks manageable?
- Is timing appropriate?

#### **Round 4: Final Decision & Next Steps** (10 minutes)

- **Decision**: Go/No-Go with reasoning
- **If Go**: Confirm first phase scope and timeline
- **If No-Go**: Identify what needs to change for future Go decision

### **Deliverables**

- [ ] Risk register with mitigation plans
- [ ] Go/No-Go decision with rationale
- [ ] Immediate next steps identified
- [ ] Success criteria for first phase

---

## 🎯 Workshop Success Tips

### **For Facilitators**

- **Time management**: Use visible countdown timers
- **Participation**: Ensure everyone speaks in each round
- **Conflict resolution**: Focus debates on technical merit, not personalities
- **Energy management**: Take 10-minute breaks every hour

### **For Participants**

- **Come prepared**: Do the pre-work seriously
- **Challenge ideas**: Ask "what if this doesn't work?"
- **Stay focused**: Avoid rabbit holes and scope creep
- **Document everything**: Decisions lose value if forgotten

### **For Remote Teams**

- **Tools**: Miro/Mural for visual collaboration
- **Breakouts**: Use smaller groups to increase participation
- **Engagement**: More frequent check-ins and breaks
- **Follow-up**: Share recordings and outputs immediately

---

## 📊 Workshop Output Tracking

### **Immediate Outputs** (End of each workshop)

- [ ] Session summary document
- [ ] Decision log
- [ ] Action items with owners
- [ ] Questions requiring follow-up research

### **Cumulative Outputs** (End of 2 weeks)

- [ ] Current state analysis complete
- [ ] Target architecture designed and agreed
- [ ] Implementation plan with phases and timelines
- [ ] Risk assessment and mitigation strategies
- [ ] Team alignment and buy-in achieved

### **Success Metrics**

- **Team confidence**: Survey team readiness 1-10 scale
- **Decision quality**: Can team explain rationale for each choice?
- **Implementation readiness**: Are acceptance criteria clear and measurable?
- **Risk management**: Are top 3 risks identified with mitigation plans?

---

**🚀 These workshops will transform your team from "following templates" to "making informed architectural decisions." The collaborative approach ensures everyone understands not just what you're building, but why you're building it that way.**
