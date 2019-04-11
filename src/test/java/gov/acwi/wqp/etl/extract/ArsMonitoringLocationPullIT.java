package gov.acwi.wqp.etl.extract;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.nio.charset.Charset;
import java.sql.SQLException;

import javax.annotation.PostConstruct;

import org.junit.Before;
import org.junit.Test;
import org.springframework.batch.core.ExitStatus;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.job.flow.Flow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.jdbc.datasource.init.ScriptException;
import org.springframework.jdbc.datasource.init.ScriptUtils;

import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import com.github.springtestdbunit.assertion.DatabaseAssertionMode;

import gov.acwi.wqp.etl.BaseArsFlowIT;

public class ArsMonitoringLocationPullIT extends BaseArsFlowIT {

	@Autowired
	@Qualifier("arsMonitoringLocationPullFlow")
	private Flow arsMonitoringLocationPullFlow;

	@PostConstruct
	public void beforeClass() throws ScriptException, SQLException {
		EncodedResource encodedResource = new EncodedResource(resource, Charset.forName("UTF-8"));
		ScriptUtils.executeSqlScript(dataSource.getConnection(), encodedResource);
	}

	@Before
	public void setup() {
		testJob = jobBuilderFactory.get("arsMonitoringLocationPullFlowTest")
				.start(arsMonitoringLocationPullFlow)
				.build()
				.build();
		jobLauncherTestUtils.setJob(testJob);
	}

	@Test
	@DatabaseSetup(connection="ars", value="classpath:/testData/ars/monitoringLocationOld.xml")
	@ExpectedDatabase(connection="ars", value="classpath:/testResult/ars/monitoringLocationEmpty.xml", assertionMode=DatabaseAssertionMode.NON_STRICT_UNORDERED)
	public void truncateArsMonitoringLocationStepTest() {
		try {
			JobExecution jobExecution = jobLauncherTestUtils.launchStep("truncateArsMonitoringLocationStep", testJobParameters);
			assertEquals(ExitStatus.COMPLETED, jobExecution.getExitStatus());
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getLocalizedMessage());
		}
	}

	@Test
	@DatabaseSetup(connection="ars", value="classpath:/testResult/ars/monitoringLocationEmpty.xml")
	@ExpectedDatabase(connection="ars", value="classpath:/testResult/ars/monitoringLocation.xml", assertionMode=DatabaseAssertionMode.NON_STRICT_UNORDERED)
	public void arsMonitoringLocationPullStepTest() {
		try {
			JobExecution jobExecution = jobLauncherTestUtils.launchStep("arsMonitoringLocationPullStep", testJobParameters);
			assertEquals(ExitStatus.COMPLETED, jobExecution.getExitStatus());
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getLocalizedMessage());
		}
	}

	@Test
	@DatabaseSetup(connection="ars", value="classpath:/testData/ars/monitoringLocationOld.xml")
	@ExpectedDatabase(connection="ars", value="classpath:/testResult/ars/monitoringLocation.xml", assertionMode=DatabaseAssertionMode.NON_STRICT_UNORDERED)
	public void arsMonitoringLocationPullFlowTest() {
		Job arsMonitoringLocationPullFlowTest = jobBuilderFactory.get("arsMonitoringLocationPullFlowTest")
					.start(arsMonitoringLocationPullFlow)
					.build()
					.build();
		jobLauncherTestUtils.setJob(arsMonitoringLocationPullFlowTest);
		try {
			JobExecution jobExecution = jobLauncherTestUtils.launchJob(testJobParameters);
			assertEquals(ExitStatus.COMPLETED, jobExecution.getExitStatus());
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getLocalizedMessage());
		}
	}

}